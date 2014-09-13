needs "protocols/mutagenesis_workflow/lib/standard"
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
      fragment_ids: [2058,2059,2060,2061],
      #Enter correspoding plasmid id or fragment id for each fragment to be Gibsoned in.
      plasmid_ids: [2236,2236,2236,2236]
    }
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

    # Tell the user what we are doing
    show {
      title "Fragment Information"
      note (length.collect {|l| "#{l}"})
      note (conc.collect {|c| "#{c}"})
    }
  end

end