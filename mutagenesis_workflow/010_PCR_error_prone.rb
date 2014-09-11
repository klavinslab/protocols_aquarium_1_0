needs "aqualib/lib/standard"
needs "protocols/mutagenesis_workflow/lib/cloning"

class Protocol

  include Standard
  include Cloning

  def debug
    false
  end

  def arguments
    {
      #Enter the fragment sample id (not item ids) as a list, eg [2048,2049,2060,2061,2,2]
      fragment_ids: [2062],
      #Enter expected number of mutations on this fragment
      mutation_nums: [4]
    }
  end

  def main

    # Collect fragment info
    fragment_info_list = []
    not_ready = []
    mutation_nums = input[:mutation_nums]

    input[:fragment_ids].each do |fid|
      info = fragment_info fid
      fragment_info_list.push info   if info
      not_ready.push fid if !info
    end

    fragments       = fragment_info_list.collect { |fi| fi[:fragment] }
    length			    = fragment_info_list.collect { |fi| fi[:length] }
    net_length      = fragment_info_list.collect { |fi| fi[:net_length] }
    templates       = fragment_info_list.collect { |fi| fi[:template] }
    template_length = fragment_info_list.collect { |fi| fi[:template_length] }
    conc            = fragment_info_list.collect { |fi| fi[:conc] }
    forward_primers = fragment_info_list.collect { |fi| fi[:fwd] }
    reverse_primers = fragment_info_list.collect { |fi| fi[:rev] }
    temperatures    = fragment_info_list.collect { |fi| fi[:tanneal] }
    props 			    = fragment_info_list.collect { |fi| fi[:props] }

    # find the average annealing temperature
    tanneal = temperatures.inject{ |sum, el| sum + el }.to_f / temperatures.size


    # find target amount in template for error prone PCR
    mutation_nums_kb = mutation_nums.map.with_index { |m,i| m * 1000.0 / length[i] }
    target_amount    = mutation_nums_kb.collect { |n| Math.exp((12.6-n)/1.9) }
    template_amount  = target_amount.map.with_index { |t,i| t * template_length[i] / length[i]}
    template_volume  = template_amount.map.with_index { |t,i| t / conc[i]}

    # find template vol and id, primer vol and id, water vol to add error prone PCR
    template_id_vol    = templates.map.with_index {|t,i| template_volume[i].round(1).to_s + " µL of " + t.id.to_s}
    water_vol           = template_volume.collect {|v| (42.5 - v).round(1).to_s + " µL"}
    forward_primers_vol = forward_primers.map.with_index {|f| "0.25 µL of " + f.id.to_s}
    reverse_primers_vol = reverse_primers.map.with_index {|f| "0.25 µL of " + f.id.to_s}



    # Tell the user what we are doing
    show {
      title "Fragment Information"
      note "This protocol will build the following fragments with expected input mutation numbers:"
      note (fragments.map.with_index { |f,i| " #{f} with #{mutation_nums[i]} bps mutations" })
      note ("The amount in ng for each template needed to be add are:" )
      note (template_amount.collect { |t| "#{t.round(2)}"  })
      note (net_length.collect { |l| "#{l}"})
      #note (template_length.collect { |l| "#{l}"})
      #note (props.collect {|p| "#{p}"})
      #note (template_volume.collect {|c| "#{c.round(2)}"})
      if not_ready.any?
        separator
        note "The following fragments have missing ingredients and will not be built:"
        note not_ready.collect { |f| " #{f}"}
      end
    }

    # Take the primers and templates
    take templates + forward_primers + reverse_primers, interactive: true,  method: "boxes"

    # Get phusion enzyme
    buffer_stock_item = choose_sample "10X Mutazyme II reaction buffer"
    dNTP_stock_item = choose_sample "40 mM dNTP mix"
    mutazymeII_stock_item = choose_sample "Mutazyme II DNA polymerase"

    # Set up stripwells
    stripwells = produce spread fragments, "Stripwell", 1, 12

    show {
      title "Prepare Stripwell Tubes"
      stripwells.each do |sw|
        check "Label a new stripwell with the id #{sw}."
        separator
      end
      # TODO: Put an image of a labeled stripwell here
    }

    # Set up reactions
    load_samples_variable_vol( [ "Template", "Forward Primer", "Reverse Primer", "Molecular Grade Water" ], [
        template_id_vol,
        forward_primers_vol,
        reverse_primers_vol,
        water_vol
      ], stripwells ) {
        note "Load templates first, then forward primers, then reverse primers."
        warning "Use a fresh pipette tip for each transfer."
      }

    show {
      title "Add Buffer, dNTPs and Mutazyme II"
      stripwells.each do |sw|
        check "Pipette 5 µL of 10X Mutazyme II Buffer (item #{buffer_stock_item}) into each of wells " + sw.non_empty_string + " of stripwell #{sw}."
        check "Pipette 1 µL of 40 mM dNTP mix (item #{dNTP_stock_item}) into each of wells " + sw.non_empty_string + " of stripwell #{sw}."
        check "Pipette 1 µL of Mutazyme II DNA polymerase (item #{mutazymeII_stock_item}) into each of wells " + sw.non_empty_string + " of stripwell #{sw}."
      end
      separator
      warning "Use a new pipette tip for each pipetting! Pipette up and down to mix."
    }


    # Run the thermocycler
    thermocycler = show {
      title "Start the reactions"
      check "Put the cap on each stripwell. Press each one very hard to make sure it is sealed."
      separator
      check "Place the stripwells into an available thermal cycler and close the lid."
      get "text", var: "name", label: "Enter the name of the thermocycler used", default: "T1"
      separator
      check "Click 'Home' then click 'Saved Protocol'. Choose 'YY' and then 'ERRORPCR'."
      check "Set the anneal temperature to #{tanneal.round(0)-5}. This is the 3rd temperature."
      check "Press 'run' and select 50 µL."
      # TODO: image: "thermal_cycler_home"
    }

    # Set the location of the stripwells to be the name of the thermocycler
    stripwells.each do |sw|
      sw.move thermocycler[:name]
    end

    # Release the templates, primers, and enzymes
    release templates + forward_primers + reverse_primers + [ buffer_stock_item ] + [dNTP_stock_item] + [mutazymeII_stock_item], interactive: true, method: "boxes" 

    # Release the stripwells silently, since they should stay in the thermocycler
    release stripwells

    return input.merge stripwell_ids: stripwells.collect { |s| s.id }

  end

end












