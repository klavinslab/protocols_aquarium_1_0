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
  gibson_master_mix_amt: number, "Amount of Gibson master mix to add to PCR tube, in uL"
end

function collect_from_hash(hash, nested_key_array)
  # each level should give back an array
  # or allow placeholders like * to denote
  # when get a hash back or an array back, etc
  local vals = hash
      
end

to_release = [ ]
#  pattern - edit tags / values in hashes on datastructures
# like [:this_protocol][:completed] = true
# instead of holding values in memory / putting them in arrays

step
  description: "Take fragments for Gibsons"
  note: "Go to the locations listed on the next page to take fragments for all the gibsons.
         You don't need to keep them on ice."
end

# iterate over pipetting plan and collect fragment ids
fragments = [ ]
foreach f in pipetting_plan
  fragments = concat(fragments, f.fragment_ids)
end

fragments = unique(fragments)

take
    x = item fragments
end

to_release = x

fragments = to_release # this is an array of { id: #, name: "sdfsdf", data: {...}}

step
  description: "What are taken fragments?"
  note: "%{fragments}"
end

sum = 0
foreach p in plasmids_to_make
  sum = sum + p[:quantity]
end

#probably do this in groups instead
step
  description: "Take %{sum} PCR tubes"
  note: "Take enough PCR tubes for the next labeling steps.
         Keep them separate by letter since you will
         pipette by letter groups."
end

foreach p in plasmids_to_make
  num = p[:quantity]
  l = p[:letter]
  vol_mg_water_to_add = p[:vol_mg_water_to_add]
  step
    description: "Label %{num} PCR tubes and pipette MG water"
    note: "Label %{num} PCR tubes, %{letter}1 to %{letter}%{num}
           by writing on the sides of the tubes near the top
           (otherwise they will be smudged off, see second picture).
           Pipette %{vol_mg_water_to_add}uL of MG water into each tube."
  end
end

#for each pipetting step, do that step
foreach p in pipetting_plan
  f_name = p[:fragment_name]
  f_ids = p[:fragment_ids]
  targets = p[:plasmid_letter_start_end_amounts]
  step
      description: "Pipette %{f_name}"
      note: "Pipette the following amounts from %{f_ids} into the following tubes,
             putting the amount into each tube from letter start to end.
             There will be a separate screen for each, and they are summarized
             below:
             %{targets}"
  end
    
  foreach plsea in p[:plasmid_letter_start_end_amounts]
    amt = plsea[:amount]
    step
      description: "Pipette %{f_name} into sample(s)"
      note: "Pipette a total of %{amt} microliters from %{f_ids} into each of tube(s)
             %{letter}{%start} to %{letter}%{end}, inclusive."
    end
  end # todo put all on one screen nicely once can concat strings
end


step
  description: "Check there is an open thermocycler"
  note: "In the next step you'll add Gibson master mix.
         The exonuclease in gibson master mix begins eating fragments immediately
         after you put it in. Check there is an available thermocycler with
         enough space before adding the gibson master mix. If not, wait until
         there is an open thermocycler and continue then."
end

step
  description: "Put the gibsons into the thermocycler."
  note: "Take the tubes to the thermocycler and log into the station there,
         or, if you have done this before, you can click through the steps here.
         You'll put them in for XX minutes"
end

step
  description: "Start the Gibson reaction"
  check: "Add %{gibson_master_mix_amt}µL of gibson aliquot to each tube. Do this expediently."
end

#silently produce gibsons


# call step from a library here

# nice to have enter the gibsons that you put in the thermocycler, ids of ones that you didn't
# plus time to check back, since if making many, may not have enough thermocycler space


#Nice to have - if ran out of fragment stock or no stock for that fragment
# let people specify the tubes here, then reschedule them
# might be better to implement a generic exeption step for that, anything produce in the protocol
# let the user manipulate the inventory / reschedule them
# need a generic way to reconstruct the datastructure used to produce them to do that
aborted_samples = [ ] # route these to another protocol to just put them in the thermocycler

log
  return: {completed_samples: gibsons, aborted_samples: aborted_samples} # put resulting samples from produce here
end

release to_release
