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

  step
    description: "Set up for primer " + to_string(primers[n][:id])
    check: "Stock: Label the tube with primer " + to_string(primers[n][:id]) + " with the item number " + to_string(stocks[n][:id])
    check: "Aliquot: Label a new 1.5 mL tube with the item number " + to_string(aliquots[n][:id])
    getdata
      mass: number, "Enter the number of nanomoles of DNA in the tube"
    end
  end

  step
    description: "Make stock
  end

  n = n + 1

end
