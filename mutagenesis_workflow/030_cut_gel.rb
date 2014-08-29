needs "aqualib/lib/standard"
class Protocol

  include Standard

  def debug
    
  end

  def arguments
    {
      fragment_ids: [],
      gels_ids: [],
      stripwell_ids: [],
      volume: 50       # The volume of PCR fragment to load in µL
    }
  end

  def main
  
    gels = input[:gels_ids].collect { |gid| collection_from gid }  
    stripwells = input[:stripwell_ids].collect { |sid| collection_from sid }

    take gels, interactive: true
      
    num_samples = stripwells.inject(0) { |sum,sw| sum + sw.num_samples }

    gel_slice_list = []
    size_list = []

    input[:fragment_ids].each do |fid|
      fragment = find(:sample,{id: pid})[0]
      name = fragment.name
      size = fragment.properties["Length"]
      gel_slice = produce new_sample name, of: "Fragment", as: "Gel Slice"
      gel_slice_list = gel_slice_list.push primer_stock
      size_list = size_list.push size
    end


    show {
      title "Take out #{num_samples} 1.5 mL tubes and label each #{gel_slice_list} and #{size_slice_list}"
      note "Take out #{num_samples}  1.5 mL tubes and label them (ON THE SIDE) 1 through #{num_samples}."
    }



  end

end