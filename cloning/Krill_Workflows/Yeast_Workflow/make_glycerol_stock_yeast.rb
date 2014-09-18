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
      
      glycerolstocks=[]
      table1=[["Cyro tube IDs"]]
      table2=[["Overnights IDs to add","Cyro tube ID to add to"]]
      
      
      overnights.each do |overnight|
        
        j = produce new_sample overnight.sample.name, of: "Yeast Strain", as: "Yeast Glycerol Stock"
        glycerolstocks.push(j)
        table1.push(j.id)
        table2.push([overnight.id,j.id])
        
      end
      
      show {
        note "Label the Cyro tubes according to the table below writing the name on a sticker on the top of the tube as well as the side along with the date"
        table table1
      }

      show {
        title "Pipette 900 µL of 50 percent Glycerol stock  Cyro tube(s)."
        warning "Make sure not to touch the inner side of the Glycerol bottle with the pipetter."
      }
      
      show {
        note "Pipette 900 µL of yeast overnight into a Cyro tube accordint to the table and then vortex on a table top vortexer for about 20 seconds"
        table table2
      }
      
      release glycerolstocks, interactive: true
      release overnights, interactive: true
      #release glycerol, interactive: true
  end
  
end
