needs "aqualib/lib/standard"
needs "aqualib/lib/cloning"
needs "protocols/recombineering/lib/ctutility"

class Protocol

  include Standard
  include Cloning
  include CTUtility

  def arguments
    {
      io_hash: {},
      lysate_ids: [32378,32379,32380,32381],
      f_primers: [10774,10774,10775,10774],
      r_primers: [10778,10778,10779,10778],
      debug_mode: "No"
    }
  end

  def main
    assay_fragment_samp = find(:sample, id: 1587)[0]
    #if no io hash use inputs.
    #if there is an io hash, merge inputs
    if (input[:io_hash]==nil) || input[:io_hash].empty?
      io_hash = input
      io_hash.delete(:io_hash) #clean up to prevent future mistakes
    else
      io_hash = input[:io_hash]
      io_hash[:lysate_ids]=
        (io_hash[:lysate_ids] || []) + (input[:lysate_ids] || [])
      io_hash[:f_primers] = (io_hash[:f_primers] || []) + 
                              (input[:f_primers] || [])
      io_hash[:r_primers] = (io_hash[:r_primers] || []) + 
                              (input[:r_primers] || [])
    end

    if io_hash[:debug_mode].downcase == "yes"
      def debug
        true
      end
    end

    lysate_ids = io_hash[:lysate_ids]
    fp_ids = io_hash[:f_primers]
    rp_ids = io_hash[:r_primers]
    lysates = take_by_id(lysate_ids,true)
    primers = take_by_id(fp_ids+rp_ids,true)
    fp = fp_ids.collect{|id| primers.select{|p| p.id==id}[0]}
    rp = rp_ids.collect{|id| primers.select{|p| p.id==id}[0]}

    temp = primers.collect {|p| p.sample.properties["T Anneal"]}
    tanneal = temp.min

    # Get phusion enzyme
    phusion_stock_item = choose_sample "Phusion HF Master Mix", take: true
    
    stripwells = produce spread [assay_fragment_samp]*lysate_ids.length, 
                        "Stripwell",1,12

    show {
      title "Prepare Stripwell Tubes"
      stripwells.each_with_index do |pcr_sw, idx|
        check "Label a new stripwell with the id #{pcr_sw}."
        check "Pipette 3.5 µL of molecular grade water into wells " + 
               pcr_sw.non_empty_string + "."
        separator
      end
    }

    load_samples(
      [ "Template, .5 µL", "Forward Primer, .5 µL", "Reverse Primer, .5 µL" ],
      [  lysates, fp , rp ],
      stripwells ) {
        warning "Use a fresh pipette tip for each transfer."
      }

    # Add master mix
    show {
      title "Add Master Mix"
      stripwells.each do |sw|
        check "Pipette 5 µL of master mix (item #{phusion_stock_item}) into 
               each of wells " + sw.non_empty_string + " of stripwell #{sw}."
      end
      separator
      warning "USE A NEW PIPETTE TIP FOR EACH WELL AND PIPETTE UP 
               AND DOWN TO MIX"
    }

    release [phusion_stock_item], interactive: true, method: "boxes"
    # Run the thermocycler
    thermocycler = show {
      title "Start the reactions"
      check "Put the cap on each stripwell. Press each one very hard to make sure it is sealed."
      separator
      check "Place the stripwells into an available thermal cycler and close the lid."
      get "text", var: "name", label: "Enter the name of the thermocycler used", default: "TC1"
      separator
      check "Click 'Home' then click 'Saved Protocol'. Choose 'YY' and then 'COLONYPCR'."
      check "Set the anneal temperature to #{tanneal.round(0)}. This is the 3rd temperature."
      check "Set the 4th time (extension time) to be 2 minutes"
      check "Press 'run' and select 10 µL."
    }

    # Set the location of the stripwells to be the name of the thermocycler
    stripwells.each do |sw|
      sw.move thermocycler[:name]
    end

    # Release the stripwells silently, since they should stay in the thermocycler
    release stripwells
    release lysates, interactive: true

    release primers, interactive: true, method: "boxes"

    io_hash[:stripwell_ids] = stripwells.collect { |s| s.id }
    return { io_hash: io_hash }

  end

end
