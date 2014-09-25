argument
  plates: sample array, "Enter in plates containing colonies of a strain of E. Coli you would like to culture."
  number_colonies: number, "Number of colonies to start overnights of from the plate"
  antibiotic: string, "Enter in the antibiotic resistance of the above strains of E. Coli. Enter Amp, Chlor, Kan"
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


# FIXME: Media is never taken/released
# Add antibiotics
step
  description: "Add 3 mL of TB+%{antibiotic} media to the %{n_tubes} tubes using the serological pipette"
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
      check:"Make sure to mark the colony you picked from with a permanent pen, so it can be identified."
      check:"Submerge the tip into the liquid culture of the tube %{label}"
      check:"Discard tip"
      note:"Make sure to pick different colonies if creating multiple cultures from the same plate!"
    end
    j=j+1
    end
    i = i + 1
  end
  
end

produced = []
overnight_ids = []
i = 0
n = 0
while i < length(plates)
  w = pstocks[i]
  
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
i = 0
while i < n_tubes
  p = produced[i]
  modify
    produced[i]
    location: "37°C shaker incubator"
  end

  i = i + 1
end

release pstocks

log
  return: {overnight_ids: overnight_ids}
end
