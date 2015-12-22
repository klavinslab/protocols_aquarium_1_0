class Protocol

  def main

    o = op input

    o.input.all.take
    o.output.all.produce
    
    primers = o.input.all.samples
    
    tab = [[]]
    primers.each do |primer|
      tab.push [primer.id.to_s + " " + primer.name, primer.properties["Overhang Sequence"] + primer.properties["Anneal Sequence"]]
    end


    idt = show {
      title "Create an IDT DNA oligos order"
      check "Go to the <a href='https://www.idtdna.com/site/account' target='_blank'>IDT website</a>, log in with the lab account. (Username: klavins_lab, password is the lab general password)."
      check "Click Custom DNA Oligos, click Bulk Input. Copy paste the following table and then click the Update button."
      table tab
      check "Click Add to Order, review the shopping cart to double check that you entered correctly. There should be #{primers.length} primers in the cart."
      check "Click Checkout, then click Continue."
      check "Enter the payment information, click the oligo card tab, select the Card1 in Choose Payment and then click Submit Order."
      check "Go back to the main page, find the order number for the order you just placed, enter in the following."
      get "text", var: "order_number", label: "Enter the IDT order number below", default: 100
    }


    o.input.all.release
    o.output.all.release

    return o.result

  end

end
