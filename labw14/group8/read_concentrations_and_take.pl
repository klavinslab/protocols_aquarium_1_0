require "labw14/group8/lib_read_gibson.pl"

g = ask_filename_then_get_gibsons()

# idea TODO
# build up a data structure using loops etc that define experiment
# then iterate through that data structure, showing it
step
  description: "print out the gibson array"
  note: "%{g}"
end

plasmids_to_make = g[:plasmids_to_make]
fragments_to_take = [ ]


foreach p in plasmids_to_make
 name = p[:plasmid_name_to_make]
 step
   description: "Check plasmid exists"
   note: "Go into the Inventory and check that a plasmid named '%{name}'
          exists and the name matches the name in your specification file."
 end
 foreach f in p[:fragment_amounts_in_ul]
   fragments_to_take = append(fragments_to_take, f[:name])
 end
end

fragments_to_take = unique(fragments_to_take)

# silently produce all the samples here
# associate their ids
# with the correct fragments so we get
# fragment => [{id, amount}]

total_amounts = [ ]
# todo extract these into hash and other libraries
# NOTE this doesn't work like a hash in other languages
foreach name in fragments_to_take
  total = 0
  foreach p in plasmids_to_make
    foreach f in p[:fragment_amounts_in_ul]
      if  f[:name] == name
        total = total + p[:quantity_to_make]*f[:amount]
      end
    end
  end
  total_amounts = append(total_amounts, { fragment_name: name, total_amount: total, fragment_taken: 0})
end

#foreach p in plasmids_to_make
#  total = 0
#  foreach f in p[:fragment_amounts_in_ul]
#    total_amounts[f[:fragment_name]] = total_amounts[f[:fragment_name]] + p[:quantity_to_make]*f[:amount]
#  end
#end
  

foreach f in total_amounts
  amount = f[:total_amount]
  name = f[:fragment_name]
  step
    description: "Claim fragment %{name}"
    note: "Go into the Inventory and put enough stock of fragment %{name}.
          (you will use a total of %{amount} microliters) into your cart.
          You will go physically take them formally in the next protocol.
          You will be reminded of how much you will need so you can
          check by eye that you should have enough."
  end
end

# silently produce the future samples
# and label them, laying them out in a grid
# put the concentrations into the data element
# todo show as picture, make a manual one for now, single pic

samples_to_make = [ ]
foreach p in plasmids_to_make
  name = p[:plasmid_name_to_make]
  quantity = p[:quantity_to_make]
  produce silently
     r = quantity "Gibson Reaction Result" of name
     location: "Bench"
     data
         concentration: 123
     end
  end
  samples_to_make = concat(samples_to_make, r)
end

# foreach fragment
# pipette fragment into samples %[[{sample: id, amount: number} sorted by number increasing]
# todo a function that makes a pipetting plan 
# todo sort the fragments in the order of most used

fragments = fragments_to_take

log
  return: {gibsons: samples_to_make, fragments: fragments}
end
