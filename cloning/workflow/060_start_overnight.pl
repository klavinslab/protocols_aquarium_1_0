#starts an overnight culture from bacteria

argument
  glycerol_stocks: sample array, "Enter in glycerol stocks of a specific cell of E. Coli you would like to culture."
  plates: sample array, "Enter in plates containing colonies of a strain of E. Coli you would like to culture."
  overnight: sample array, "Enter in exisiting overnights of E. Coli strains you wish to culture."
  antibiotic: string array, "Enter in the antibiotic resistance of the above strains of E. Coli. Enter Amp, Chlor, Kan, Amp+Chlor, Amp+Kan, Chlor+Kan or None."
end

# Take (if applicable) glycerol stocks, plates, and overnights
gstocks = []
if length(glycerol_stocks) > 0
  step
    description: "Ignore the following take, the glycerol stock will be taken later in the protocol."
  end
  take
    gstocks = item unique(glycerol_stocks)
  end
end
pstocks = []
if length(plates) > 0
  take
    pstocks = item unique(plates)
  end
end
ostocks=[]
if length(overnight) > 0
  take
    ostocks = item unique(overnight)
  end
end

# Take tubes
n_tubes = length(glycerol_stocks) + length(plates) + length(overnight)

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
    elsif antibiotic[i] == "Amp+Chlor"
      ampchlor_tubes = append(ampchlor_tubes, tube_n)
    elsif antibiotic[i] == "Amp+Kan"
      ampkan_tubes = append(ampkan_tubes, tube_n)
    elsif antibiotic[i] == "Chlor+Kan"
      chlorkan_tubes = append(chlorkan_tubes, tube_n)
    # This variable never gets used?
    elsif antibiotic[i] == "None"
      none_tubes = append(none_tubes, tube_n)
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
if length(ampkan_tubes) > 0
  step
    description: "Add 3 mL of TB+Amp+Kan media to tubes %{ampkan_tubes} using the serological pipette"
  end
end
if length(ampchlor_tubes) > 0
  step
    description: "Add 3 mL of TB+Amp+Chlor media to tubes %{ampchlor_tubes} using the serological pipette"
  end
end
if length(chlorkan_tubes) > 0
  step
    description: "Add 3 mL of TB+Chlor+Kan media to tubes %{chlorkan_tubes} using the serological pipette"
  end
end

gn = length(glycerol_stocks)
step
  description: "%{gn}"
end

# Inoculate
if length(glycerol_stocks) > 0
  step
    description: "Walk to the -80 degree freezer with rack of culture tubes."
  end

  i = 0
  while i < length(glycerol_stocks)
    label = i + 1
    g = glycerol_stocks[i]
    step
      check:"Remove glycercol stock %{g} from -80 freezer."
      check:"Carefully open tube and remove a small amount of frozen cells with a pipette tip"
      check:"Submurge the tip into the liquid culture of tube %{label}, be sure to use sterile technique"
      check:"Discard tip"
      check:"replace cap on glycerol stock and put it back into the -80 freezer"
    end
    i = i + 1
  end
end

if length(plates) > 0
  i = 0
  while i < length(plates)
    label = length(glycerol_stocks) + i + 1
    p = plates[i]
    step
      check:"Take a small pipette tip and grab a small amount of colony from plate %{p}. Be sure to use sterile technique."
      check:"Make sure to mark the colony you picked from with a permanent pen, so it can be identified."
      check:"Submerge the tip into the liquid culture of the tube %{label}"
      check:"Discard tip"
      note:"Make sure to pick different colonies if creating multiple cultures from the same plate!"
    end
    i = i + 1
  end
end

if length(overnight) > 0
  i = 0
  while i < length(overnight)
    label = length(glycerol_stocks) + length(plates) + i + 1
    o = overnight[i]
      step
        check: "Take overnight culture %{o} and vortex the tube."
        check: "Pipette 3µl of overnight culture %{o} and pipette into tube %{label}"
      end
    i = i + 1
  end
end

combined_input_ids = concat(glycerol_stocks, plates)
combined_input_ids = concat(combined_input_ids, overnight)
total_taken = concat(gstocks, pstocks)
total_taken = concat(total_taken, ostocks)
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
i = 0
while i < n_tubes
  n = i + 1
  w = to_produce_from[i]
  produce
    q = 1 "TB Overnight of Plasmid" from w
    note: "Label tube %{n} with this id."
    location: "Benchtop"
  end
  produced = append(produced, q)
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
    produced[0]
    location: "37°C shaker incubator"
  end

  i = i + 1
end

release(total_taken)
