argument
  plates: sample array, "Enter in plates containing colonies of a strain of E. Coli you would like to culture."
  number_colonies: number, "Number of colonies to start overnights of from the plate"
  antibiotic: string array, "Enter in the antibiotic resistance of the above strains of E. Coli. Enter Amp, Chlor, Kan"
end

# Take (if applicable) glycerol stocks, plates, and overnights
pstocks = []
if length(plates) > 0
  take
    pstocks = item unique(plates)
  end
end

# Take tubes
n_tubes = length(plates)*number_colonies

if n_tubes > 1
  step
    description: "Grab %{n_tubes} glass 14 mL tubes from B1.450 and place them in a plastic tube rack label them 1 through %{n_tubes} with a pen"
  end
else
  step
    description: "Grab 1 glass 14 mL tube from B1.450 and place it in a plastic tube rack"
  end
end

# Keep track of which tubes need antibiotics - an array for each antibiotic
# to save on steps (i.e. get out Amp and add to appropriate tubes, then kan,
# etc)
amp_tubes = []
amp_tube_count = 0
chlor_tubes = []
chlor_tube_count = 0
kan_tubes = []
kan_tube_count = 0
ampchlor_tubes = []
ampchlor_tube_count = 0
ampkan_tubes = []
ampkan_tube_count = 0
chlorkan_tubes = []
chlorkan_tube_count = 0
none_tubes = []
none_tube_count = 0

i = 0
while i < n_tubes
    tube_n = i + 1
    if antibiotic[i] == "Amp"
      amp_tubes = append(amp_tubes, tube_n)
    elsif antibiotic[i] == "Chlor"
      chlor_tubes = append(chlor_tubes, tube_n)
    elsif antibiotic[i] == "Kan"
      kan_tubes = append(kan_tubes, tube_n)
    end

  i = i + 1
end

# FIXME: Media is never taken/released
# Add antibiotics
if length(amp_tubes) > 0
  step
    description: "Add 3 mL of TB+Amp media to tubes %{amp_tubes} using the serological pipette"
  end
end
if length(kan_tubes) > 0
  step
    description: "Add 3 mL of TB+Kan media to tubes %{kan_tubes} using the serological pipette"
  end
end
if length(chlor_tubes) > 0
  step
    description: "Add 3 mL of TB+Chlor media to tubes %{chlor_tubes} using the serological pipette"
  end
end


if length(plates) > 0
  i = 0
  label = 0
  
  while i < length(plates)
    p = plates[i]
    j=0
    while j < number_colonies
    label = label  + 1
    step
      check:"Take a small pipette tip and grab a small amount of colony from plate %{p}. Be sure to use sterile technique."
      check:"Make sure to make the colony you picked from with a permanent pen, so it can be identified."
      check:"Submerge the tip into the liquid culture of the tube %{label}"
      check:"Discard tip"
      note:"Make sure to pick different colonies if creating multiple cultures from the same plate!"
    end
    j=j+1
    end
    i = i + 1
  end
  
end

combined_input_ids = plates
total_taken = pstocks
n_taken = length(total_taken)

to_produce_from = []
current_taken = []
i = 0
while i < length(combined_input_ids)
  j = 0
  while j < length(total_taken)
    current_item = total_taken[j]
    if combined_input_ids[i] == current_item[:id]
      to_produce_from = append(to_produce_from, current_item)
    end
    j = j + 1
  end
  i = i + 1
end

produced = []
overnight_ids = []
i = 0
n = 0
while i < length(plates)
  w = to_produce_from[i]
  
  j = 0
  while j < number_colonies
    n = n + 1
    produce
      q = 1 "TB Overnight of Plasmid" from w
      note: "Label tube %{n} with this id."
      location: "Benchtop"
    end
    produced = append(produced, q)
    overnight_ids = append(overnight_ids, q[:id])
    j = j + 1
  end
  i = i + 1
end

step
  description: "Make sure caps are attached loosely on all tubes (for good aeration) and place them in B13.425 (large 37°C shaker incubator)"
end

# FIXME: Not sure how to manage locations of these tubes (they're samples - locations will conflict) until shaker tracked like freezers.
#i = 0
#while i < n_tubes
#  p = produced[i]
#  modify
#    produced[i]
#    location: "37°C shaker incubator"
#  end

#  i = i + 1
#end

release(total_taken)

log
  return: {overnight_ids: overnight_ids}
end
