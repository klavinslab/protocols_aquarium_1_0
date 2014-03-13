
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
# rename fragment to ingredient
# first fragment should be water
# last fragment  should be 15ul gibson master mix

                                            
argument
  plasmids_to_make: sample, "a hash with plasmids"
  pipetting_plan: sample, "a hash with fragment names and amounts"
  fragments: sample array, "the fragments for the gibsons"
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
  step
    description: "Label %{num} PCR tubes, %{letter}1 to %{letter}%{num}"
    note: "Label %{num} PCR tubes, %{letter}1 to %{letter}%{num}
           by writing on the sides of the tubes near the top
           (otherwise they will be smudged off, see second picture)."
  end
end

# pcr tube is 50ul total i think
step
  description: "Prepare the Gibson reaction"
  check: "Add 15µL of gibson aliquot to each tube as last step"
end

step
  description: "Prepare the Gibson reaction"
  check: "Add 15µL of gibson aliquot to each tube as last step"
end
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

#silently produce gibsons
gibsons = [ ]
step
  description: "In the next steps you will put the gibsons into the thermocycler."
  note: "Take the tubes to the thermocycler and log into the station there,
         or, if you have done this before, you can click through the steps here.
         You'll put them in for 30 minutes"
end



# call step from a library here

# nice to have enter the gibsons that you put in the thermocycler, ids of ones that you didn't
# plus time to check back, since if making many, may not have enough thermocycler space
aborted_samples = [ ] # route these to another protocol to just put them in the thermocycler

log
  return: {completed_samples: gibsons, aborted_samples: aborted_samples} # put resulting samples from produce here
end

release fragments
