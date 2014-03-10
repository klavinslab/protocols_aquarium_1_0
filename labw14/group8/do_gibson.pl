#  last step
# return: {gibsons: g, hash: {egkey: "egvalue"}}

#   plasmids_to_make: [
#        { plasmid_name: p_name,
#          letter: letters[j],
#          start: 1,
#          end: quantity}, ...],
#   pipetting_plan = [
#         [{ fragment_name: name, 
#           fragment_ids: [ ], # fragments to take from
#           total_amount: total,
#           plasmid_letter_start_end_amounts: [ 
#            { plasmid_name: p_name,
#              letter: A, # pipette into tubes A1 through A3 inclusive
#              start: 1, 
#              end: 3,
#              amount: f[:amount]}, ... ]
#                     , ... ]
                                            
argument
  plasmids_to_make: sample, "a hash with plasmids"
  pipetting_plan: sample, "a hash with fragment names and amounts"
  fragments: sample array, "the fragments for the gibsons"
  gibsons: sample array, "the gibsons to do (deprecated)"
end

to_release = [ ]
#  pattern - edit tags / values in hashes on datastructures
# like [:this_protocol][:completed] = true
# instead of holding values in memory / putting them in arrays

# show one screen in which all fragments are taken

step
  description: "Take fragments for Gibsons"
  note: "Go to the locations listed on the next page to take fragments for all the gibsons.
         %{fragments}" # this is an array of ids
end

take
    x = item fragments
end

to_release = x

fragments = to_release # this is an array of { id: #, name: "sdfsdf", data: {...}}

step
  description: "What are taken fragments?"
  note: "%{fragments}"
end


ids = [ ]
foreach g in gibsons
  ids = append (ids, g[:id])
end

#probably do this in groups instead
step
  description: "Label PCR tubes to hold the gibsons"
  note: "Take enough PCR tubes and label tubes %{ids}.
         Keep them separate by letter since you will
         pipette by letter groups."
end

foreach p in pipetting_plan

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
  description: "In the next steps you will put the gibsons into the thermocycler."
  note: "Take the tubes to the thermocycler and log into the station there,
         or, if you have done this before, you can click through the steps here."
  note: "%{gibsons}"
end

# call step from a library here

# nice to have enter the gibsons that you put in the thermocycler, ids of ones that you didn't
# plus time to check back, since if making many, may not have enough thermocycler space
aborted_samples = [ ] # route these to another protocol to just put them in the thermocycler

log
  return: {completed_samples: gibsons, aborted_samples: aborted_samples} # put resulting samples from produce here
end

release fragments
