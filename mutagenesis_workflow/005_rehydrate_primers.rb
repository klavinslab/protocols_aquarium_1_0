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
	input[:primer_ids].each do |pid|
	  primer = find(:sample,{id: pid})[0]
	  name = primer.name
	  primer_stock = produce new_sample name, of: "Primer", as: "Primer Stock"
	end

end
