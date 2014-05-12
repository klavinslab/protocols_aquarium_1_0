require "production/lib/util.pl"

information "Use this protocol to rehydrate any number of lyophilized primers that have just been received. 
             A primer stock and an initial primer aliquot will be made."

more_primers = "Yes"
primers = []
descriptions = []

while more_primers == "Yes"

  step
     description: "Enter next primer id."
     getdata
       id: number, "Primer Id (Written on Tube)"
     end
  end

  primers = append(primers,info(id))

  step
    description: "Primers"
    foreach p in primers
      note: to_string(p[:id]) + ": " + p[:name]
    end
    getdata
      more_primers: string, "Enter more primer ids?", [ "Yes", "No" ]
    end
  end

end

stocks = produce_multiple("Primer Stock", ha_select(primers,:name))
aliquots = produce_multiple("Primer Aliquot", ha_select(primers,:name))

n = 0

while n < length(primers)

  p = to_string(primers[n][:id]) + "(" + to_string(primers[n][:name]) + ")"
  s = stocks[n][:id]
  a = aliquots[n][:id]

  step
    description: "Set up for primer %{p}"
    check: "Stock: Label the tube with primer %{p} with the item number %{s}."
    check: "Aliquot: Label a new 1.5 mL tube with the item number %{a}."
    getdata
      mass: number, "Enter the number of nanomoles (nm) of DNA in the tube"
    end
  end

  te = 10*mass

  step
    description: "Make stock and aliquot for %{p}."
    check: "Spin tube %{s} for 10 seconds."
    check: "Transfer %{te} &micro;L of TE to tube %{s}"
    check: "Vortex tube %{s} for 20 seconds, then spin it down for 10 seconds."
    check: "Transfer 10 &micro;L from stock tube %{s} to aliquot tube %{a}."
    check: "Transfer 90 &micro;L of to aliquot tube %{a} and mix with the pipettor."
  end

  n = n + 1

end

step
  description: "Store sample items."
  table: concat(
    [ [ "Item Id", "Location" ] ],
    transpose([ 
      concat(ha_select(stocks,:id),ha_select(aliquots,:id)), 
      concat(ha_select(stocks,:location),ha_select(aliquots,:location)) 
    ])
  )
end
