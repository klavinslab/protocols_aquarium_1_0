require "labw14/group8/lib_read_gibson.pl"


g = ask_filename_then_get_gibsons()
complex_datastructure = g

# idea TODO
# build up a data structure using loops etc that define experiment
# then iterate through that data structure, showing it
step
  description: "debug: print out the input json"
  note: "%{g}"
end

plasmids_to_make = g[:plasmids_to_make]
fragments_to_take = [ ]


foreach p in plasmids_to_make
 name = p[:plasmid_name_to_make]
 step
   description: "Check plasmid exists"
   note: "Go into the Inventory and check that a plasmid named '%{name}'
          exists and the name matches the name in your specification file.
          You will be creating this plasmid so it must exist as a type
          in the database already."
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
letters = [["A1", "A2", "A3", "A4", "A5", "A6", "A7", "A8", "A9", "A10", "A11", "A12", "A13", "A14", "A15"],
["B1", "B2", "B3", "B4", "B5", "B6", "B7", "B8", "B9", "B10", "B11", "B12", "B13", "B14", "B15"],
["C1", "C2", "C3", "C4", "C5", "C6", "C7", "C8", "C9", "C10", "C11", "C12", "C13", "C14", "C15"],
["E1", "E2", "E3", "E4", "E5", "E6", "E7", "E8", "E9", "E10", "E11", "E12", "E13", "E14", "E15"],
["F1", "F2", "F3", "F4", "F5", "F6", "F7", "F8", "F9", "F10", "F11", "F12", "F13", "F14", "F15"],
["G1", "G2", "G3", "G4", "G5", "G6", "G7", "G8", "G9", "G10", "G11", "G12", "G13", "G14", "G15"],
["H1", "H2", "H3", "H4", "H5", "H6", "H7", "H8", "H9", "H10", "H11", "H12", "H13", "H14", "H15"],
["I1", "I2", "I3", "I4", "I5", "I6", "I7", "I8", "I9", "I10", "I11", "I12", "I13", "I14", "I15"],
["J1", "J2", "J3", "J4", "J5", "J6", "J7", "J8", "J9", "J10", "J11", "J12", "J13", "J14", "J15"],
["K1", "K2", "K3", "K4", "K5", "K6", "K7", "K8", "K9", "K10", "K11", "K12", "K13", "K14", "K15"],
["M1", "M2", "M3", "M4", "M5", "M6", "M7", "M8", "M9", "M10", "M11", "M12", "M13", "M14", "M15"],
["L1", "L2", "L3", "L4", "L5", "L6", "L7", "L8", "L9", "L10", "L11", "L12", "L13", "L14", "L15"],
["Q1", "Q2", "Q3", "Q4", "Q5", "Q6", "Q7", "Q8", "Q9", "Q10", "Q11", "Q12", "Q13", "Q14", "Q15"],
["R1", "R2", "R3", "R4", "R5", "R6", "R7", "R8", "R9", "R10", "R11", "R12", "R13", "R14", "R15"]]


samples_to_make = [ ]
planned_gibsons = [ ]
j = 0
foreach p in plasmids_to_make
  name = p[:plasmid_name_to_make]
  quantity = p[:quantity_to_make]
  i = 0
  while i < quantity
    
    produce silently
       r = 1 "Gibson Reaction Result" of name
       location: "Bench"
       data
           fragment_amounts: p[:fragment_amounts_in_ul]
           location: "Bench"
           temp_label: letters[j][i]
       end
    end
    i = i + 1
    samples_to_make = append (samples_to_make, r)
    
    # todo refactor to not produce silently here
    planned_gibsons = append(planned_gibsons, 
                      {temp_label: letters[j][i], fragment_amounts:  p[:fragment_amounts_in_ul]})
  end
  j = j + 1
end

# foreach fragment
# pipette fragment into samples %[[{sample: id, amount: number} sorted by number increasing]
# todo a function that makes a pipetting plan 
# todo sort the fragments in the order of most used


log
  return: {gibsons: samples_to_make,  pipetting_plan: pipetting_plan, planned_gibsons: planned_gibsons}
end
