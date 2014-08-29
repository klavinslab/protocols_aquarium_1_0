needs "aqualib/lib/standard"
class Protocol

  include Standard

  def debug
    true
  end

  def arguments
    {
      #Enter the primer sample id (not item ids) as a list, eg [2060,2061]
      primer_ids: [2038,2043]
    }
  end

  def main
  	primer_id_list = []
  	primer_stock_list = []

  	input[:primer_ids].each do |pid|
  		primer_id_list.push pid
  	end

  	show {
  	  primer_id_list.each do |pid|
		  primer = find(:sample,{id: pid})[0]
		  name = primer.name
		  primer_stock = produce new_sample name, of: "Primer", as: "Primer Stock"
		  #primer_stock_id = primer_stock.id		  
		  primer_stock_list.push primer_stock
		  note "Label Primer with item number on the lid"
	  end
  	}


	release(primer_stock_list,interactive: true)
  end



end
