needs "protocols/mutagenesis_workflow/lib/standard"
needs "protocols/mutagenesis_workflow/lib/cloning"

class Protocol

  include Standard
  include Cloning
  require 'matrix'

  def debug
    false
  end

  def arguments
    {
      #Enter the fragment sample id (not item ids) as a list, eg [2048,2049,2060,2061,2,2]
      fragment_ids: [2058,2059,2060,2061],
      #Enter correspoding plasmid id or fragment id for each fragment to be Gibsoned in.
      plasmid_ids: [1923,1923,1923,1923]
    }
  end

  def gibson_vector row
    if row == 0
      return 5.0
    else
      return 0
    end
  end

  def gibson_coefficients row, col, conc_over_length
    if row == 0
      return 1
    elsif col == 0
      return conc_over_length[0]
    elsif row == col
      return -conc_over_length[row]
    else
      return 0
    end
  end

  def main
    # retrieve fragment length, fragment stock, concentration
    fragment_info_list = []

    input[:fragment_ids].each do |fid|
      info = fragment_info_gibson fid
      fragment_info_list.push info   if info
    end

    length = fragment_info_list.collect { |fi| fi[:length] }
    stock  = fragment_info_list.collect { |fi| fi[:stock] }
    conc   = fragment_info_list.collect { |fi| fi[:conc] }
    conc_over_length = conc.map.with_index {|c,i| c/length[i]}

    # calculate volumes to add for each fragment stock assuming 5 µL of total volume
    total_vector = Matrix.build(conc.length, 1) {|row, col| gibson_vector row}
    coefficient_matrix = Matrix.build(conc.length, conc.length) {|row, col| gibson_coefficients row, col, conc_over_length}
    volume_vector = coefficient_matrix.inv * total_vector
    volume = volume_vector.each.to_a

    # parse unique plasmid ids
    plasmid_ids = input[:plasmid_ids]
    plasmid_uniq = plasmid_ids.uniq


    # Tell the user what we are doing
    show {
      title "Fragment Information"
      note (length.collect {|l| "#{l}"})
      note (conc.collect {|c| "#{c}"})
      note (total_vector.collect {|t| "#{t}"})
      note (conc_over_length.collect {|cl| "#{cl}"})
      note (coefficient_matrix.each {|e| "#{e}"})
      note (volume.collect {|v| "#{v.round(1)}"})
      note (plasmid_uniq.collect {|p| "#{p}"})
    }
    
    # produce gibson results ids
    gibson_results_list = []
    plasmid_uniq.each do |pid|
      plasmid = find(:sample,{id: pid})[0]
      gibson_results = produce new_sample plasmid.name, of: "Plasmid", as: "Gibson Reaction Result"
      gibson_results_list = gibson_results_list.push gibson_results
    end


    show {
      note "Take #{plasmid_uniq.length} Gibson Aliquot"
    }

    show {
      gibson_results_list.each do |gsid|
        note "Write #{gsid} on top of the "
      end
    }

  end

end