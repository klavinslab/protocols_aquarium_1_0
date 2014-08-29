needs "aqualib/lib/standard"
class Protocol

  include Standard

  def debug
    false
  end

  def arguments
    {
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

    show {
      title "Take out #{num_samples} 1.5 mL tubes and label each #{stripwell_ids} and #{gels_ids}"
      note "Take out #{num_samples}  1.5 mL tubes and label them (ON THE SIDE) 1 through #{num_samples}."
    }

  end

end