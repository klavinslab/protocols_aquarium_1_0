require "labw14/group8/lib_read_gibson.pl"


g = ask_filename_then_get_gibsons()
complex_datastructure = g

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

pipetting_plan = [ ]
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
  # get ids from the data file for the fragments to use
  f_ids = [ ]
  foreach f_to_ids in g[:debug][:fragment_name_to_sample_ids]
    if f_to_ids[:name] == name
      f_ids = f_to_ids[:ids]
    end
  end
  pipetting_plan = append(pipetting_plan, { fragment_name: name, fragment_ids: f_ids, 
                                            total_amount: total})
end

#foreach p in plasmids_to_make
#  total = 0
#  foreach f in p[:fragment_amounts_in_ul]
#    total_amounts[f[:fragment_name]] = total_amounts[f[:fragment_name]] + p[:quantity_to_make]*f[:amount]
#  end
#end
  
# TODO put take for fragments here then check that will have enough?
# no, wait for later once full protocol is running
#foreach f in pipetting_plan
#  amount = f[:total_amount]
#  name = f[:fragment_name]
#  step
#    description: "Claim fragment %{name}"
#    note: "Go into the Inventory and put enough stock of fragment %{name}
#          (total of %{amount} microliters) into your cart.
#          You will go physically take them formally in the next protocol.
#          You will be reminded of how much you will need so you can
#          check by eye that you should have enough."
#  end
#end

# silently produce the future samples
# and label them, laying them out in a grid
# put the concentrations into the data element
# todo show as picture, make a manual one for now, single pic

# todo give temporary names here such as A1,2,3...
# B1,2,3.. for another set of gibsons, etc
# so easier to write on small tube
letters = ["A", "B", "C", "E", "F", "G", "H", "I", "J", "K", "M"]

samples_to_make = [ ]
j = 0
foreach p in plasmids_to_make
  name = p[:plasmid_name_to_make]
  quantity = p[:quantity_to_make]
  i = 1
  while i <= quantity
    temp_id = to_string(i)
    letter = letters[j]
    b = concat(letter, temp_id)
    produce silently
       r = 1 "Gibson Reaction Result" of name
       location: "Bench"
       data
           fragment_amounts: p[:fragment_amounts_in_ul]
           location: "Bench"
           temp_label: b
       end
    end
    i = i + 1
    samples_to_make = append (samples_to_make, r)
    sample_id = r[:id]
  end
  j = j + 1
end

# foreach fragment
# pipette fragment into samples %[[{sample: id, amount: number} sorted by number increasing]
# todo a function that makes a pipetting plan 
# todo sort the fragments in the order of most used


log
  return: {gibsons: samples_to_make,  pipetting_plan: pipetting_plan}
end
