needs "aqualib/lib/standard"
needs "aqualib/lib/cloning"

class Protocol

  include Standard
  include Cloning


  def arguments
    {
      overnights: (SampleType.where("name='Overnight suspension culture'")[0])
    }
  end
  
  def main

    
  
  end
  
end
