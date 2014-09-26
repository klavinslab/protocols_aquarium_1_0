needs "aqualib/lib/standard"
needs "aqualib/lib/cloning"

class Protocol
  
  include Standard
  include Cloning
  
  def debug
    true
  end

  def arguments
    {
    # Enter your first and last name initials
    initials: "YY",
    plasmid_item_ids: [11247, 11247, 11248, 11248],
    primer_ids: [9963, 9966, 9963, 9966],
    genewiz_tracking_number: "00-000000000"
    }
  end
 
  def main
  	initials = input[:initials]
    plasmid_items = input[:plasmid_item_ids].collect{|pid| find(:item, id: pid )[0]} 
    primer_items = input[:primer_ids].collect{|pid| find(:item, id: pid )[0]} 
    take plasmid_items + primer_items, interactive: true, method: "boxes"

    plasmid_lengths = plasmid_items.collect{|pls| pls.sample.properties["Length"]}
    plasmid_concs = plasmid_items.collect{|pls| pls.datum[:concentration]}
    plasmid_volumes = []
    plasmid_lengths.each_with_index do |length, idx|
    	if length < 6000
    		plasmid_volumes.push (500.0/plasmid_concs[idx]).round(1)
    	elsif length < 10000
    		plasmid_volumes.push (800.0/plasmid_concs[idx]).round(1)
    	else
    		plasmid_volumes.push (10000.0/plasmid_concs[idx]).round(1)
    	end
    end
    water_volumes = 12.5 - plasmid_volumes
    			

    show {
    	note (water_volumes.collect {|p| "#{p}"})
    	note (plasmid_volumes.collect {|p| "#{p}"})
    }
  end
end

