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
    }
  end

  def main
  
    gels = input[:gels_ids].collect { |gid| collection_from gid }  
    stripwells = input[:stripwell_ids].collect { |sid| collection_from sid }

    take gels, interactive: true

    num_samples = stripwells.inject(0) { |sum,sw| sum + sw.num_samples }

    gel_slice_ids = []
    size_list = []

    input[:fragment_ids].each do |fid|
      fragment = find(:sample,{id: fid})[0]
      name = fragment.name
      prop = fragment.properties
      size = prop["Forward Primer"]
      gel_slice = produce new_sample name, of: "Fragment", as: "Gel Slice"
      gel_slice_ids = gel_slice_ids.push gel_slice
      size_list = size_list.push size
    end


    show {
      title "Take out #{num_samples} 1.5 mL tubes and label each"
      note gel_slice_ids.collect { |g| "#{g}" } 
      note size_list.collect {|s| "#{s}"}
      note "Take out #{num_samples}  1.5 mL tubes and label them (ON THE SIDE) 1 through #{num_samples}."
    }



  end

end