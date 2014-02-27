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
 step
   description: "Check plasmid exists"
   note: "Go into the Inventory and check that a plasmid named '%{p[:plasmid_name_to_make]}'
          exists for each
          plasmid you want to make and the name matches your specification
          file."
 end
 foreach f in p[:fragment_amounts_in_ul]
   fragments_to_take = append(fragments_to_take, f[:fragment_name])
 end
end

fragments_to_take = unique(fragments_to_take)

total_amounts = [ ]
# todo extract these into hash and other libraries
# NOTE this doesn't work like a hash in other languages
foreach name in fragments_to_take
  total = 0
  foreach p in plasmids_to_make
    foreach f in p[:fragment_amounts_in_ul]
      if  f[:fragment_name] == name
        total = total + p[:quantity_to_make]*f[:amount]
      else
        total = total # noop trying to fix syntax error
      end
  end
  total_amounts = append(total_amounts, { fragment_name: name, total_amount: total_amount})
end

#foreach p in plasmids_to_make
#  total = 0
#  foreach f in p[:fragment_amounts_in_ul]
#    total_amounts[f[:fragment_name]] = total_amounts[f[:fragment_name]] + p[:quantity_to_make]*f[:amount]
#  end
#end

foreach f in total_amounts
  step
    description: "Claim fragment %{f[:fragment_name]}"
    note: "Go into the Inventory and put enough stock of fragment %{f}.
          You will use a total of %{f[:total_amount]} microliters.
          You will go physically take them formally in the next step,
          but feel free to go take them now and check that there will be
          enough."
  end
end

# silently produce the future samples
# and label them, laying them out in a grid

samples_to_make = [ ]


log
  return: {gibsons: samples_to_make, hash: {egkey: "egvalue"}}
end
