#  last step
# return: {gibsons: g, hash: {egkey: "egvalue"}}

#   pipetting_plan = [
#         { fragment_name: name, 
#           fragment_ids: [ ], # fragments to take from
#           total_amount: total, 
#           add_to_sample_ids: [ {id: x, amount: in_ul}, ...]
#         }, ... ] 
                                            
argument
  pipetting_plan: sample, "a hash with fragment names and amounts"
  fragments: sample array, "the fragments for the gibsons (added to cart in last step)"
  gibsons: sample array, "the gibsons to do"
end

to_release = [ ]
#  pattern - edit tags / values in hashes on datastructures
# like [:this_protocol][:completed] = true
# instead of holding values in memory / putting them in arrays

# show one screen in which all fragments are taken

step
  description: "Take fragments for Gibsons"
  note: "Go to the locations listed to take fragments for all the gibsons.
         Check old gibson protocols to see if they need to be kept on ice, etc.
         %{fragments}" # this is an array of ids
end

foreach f in fragments
  take
    x = item f
  end
  to_release = concat (to_release, x)
end

fragments = to_release # this is an array of { id: #, name: "sdfsdf", data: {...}}

step
  description: "What are taken fragments?"
  note: "%{fragments}"
end

s = fragments[0]
test = info(s) # this fails

step
  description: "Test if can get name of fragment from sample"
  note: "%{test}"
end

ids = [ ]
foreach g in gibsons
  ids = append (ids, g[:id])
end

#probably do this in groups instead
step
  description: "Label PCR tubes to hold the gibsons"
  note: "Take enough PCR tubes and label tubes %{ids}"
end


foreach f in fragments
  sample_amount_to_pipette = [ ]
  f_info = info(f)
  f_name = f_info[:name]
  foreach g in gibsons
    #add this frag if has an amount for it
    foreach a in g[:data][:fragment_amounts]
      f_info = info(f)
      if a[:name] == f_name
        sample_amount_to_pipette = append ( sample_amount_to_pipette, {id: g[:id], amount: a[:amount]} )
      end
    end
  end
  
  num_samples = length(sample_amount_to_pipette)
  f_id = f[:id]
  step
    description: "Pipette %{f_name} into %{num_samples} sample(s)"
    note: "Pipette the following amounts from %{f_id} into the following samples:
           %{sample_amount_to_pipette}"
  end
end

step
  description: "In the next protocol we will put the gibsons into the thermocycler."
  note: "%{gibsons}"
end

aborted_samples = [ ]

log
  return: {completed_samples: gibsons, aborted_samples: aborted_samples} # put resulting samples from produce here
end

release fragments
