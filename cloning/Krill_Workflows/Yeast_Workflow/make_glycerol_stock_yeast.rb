needs "aqualib/lib/standard"
needs "aqualib/lib/cloning"

class Protocol

  include Standard
  include Cloning


  def arguments
    {
      overnight_ids: []
    }
  end
  
  def main
    
      overnights = find(:item, id: input[:overnight_ids] )
      
      take overnights, interactive: true 
      
      number_overnights = overnights.length
      
     # glycerol = choose_object "50 percent Glycerol (sterile)"
     # cyrotubes = choose_object number_overnights "Cyro tubes" <- put in correct names
      show {
        title "Pipette 900 µL of 50 percent Glycerol stock into #{number_overnights} Cyro tube(s)."
        warning "Make sure not to touch the inner side of the Glycerol bottle with the pipetter."
      }
      
    
      (overnights).each do |overnight|
        
        show {
          check "Pipette 900 µL of yeast overnight #{overnight.id} into a Cyro tube."
          check "Cap the Cryo tube and then vortex on a table top vortexer for about 20 seconds"
        }
        
        j = produce new_sample overnight.sample.name, of: "Yeast Strain", as: "Yeast Glycerol Stock"
        
        release j
        
      end
      
      release overnights
      #release glycerol
      #release cyrotubes
  end
  
end
