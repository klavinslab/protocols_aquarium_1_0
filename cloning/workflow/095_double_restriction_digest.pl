##This protocol does double digestion of a DNA sample
##Every DNA sample is digested with 2 different enzymes.


# Plasmid concentration I'm getting from plasmid sample - to be done.
# DNA amount should be in grams or mols.


function FindSample(sample_array, id)

  # Finds sample with specified ID in the array of samples
  # Inputs:
  #   sample_array - produced by take operator
  #   id - number, id of the sample I'm looking for
  # Returns instance of a sample, which has specified ID.
  
  number_of_samples = length(sample_array)
  
  sample_number = 0
  desired_sample = sample_array[0] # Just initializing, if not found, first sample will always be returned.
  
  while sample_number < number_of_samples
    
    current_sample = sample_array[sample_number]
    sample_id = current_sample[:id]
    
    if sample_id == id
      desired_sample = current_sample
    end
    
    sample_number = sample_number + 1
  
  end

  return desired_sample
  
end




argument
  initials: string, "Your initials or another 2-3 letter identifier for tube labeling"
  fragment_names: string array, "Fragment Names (names to be assigned to resulting linear fragments)"
  plasmids: sample("Plasmid") array, "Plasmids"
  enzymes1: sample("Enzyme") array, "Enzyme tube to be used as first enzyme. \nCheck enzymes for compatibility at NEB site https://www.neb.com/tools-and-resources/interactive-tools/double-digest-finder"
  enzymes2: sample("Enzyme") array, "Enzyme tube to be used as second enzyme. \nCheck enzymes for compatibility at NEB site https://www.neb.com/tools-and-resources/interactive-tools/double-digest-finder"
  bsa: sample("Enzyme Buffer"), "Tube of BSA to be used"
  buffers: sample("Enzyme Buffer") array, "Tube of buffer for restriction digest reaction.\nCheck which buffer to use at NEB site https://www.neb.com/tools-and-resources/interactive-tools/double-digest-finder "
  
end


# Initializing constants
dna_mass = 5000   # ng
buffer_vol = 10   # uL
single_enzyme_vol = 4   # uL
enzyme_vol = single_enzyme_vol*2    # uL
bsa_vol = 0.5     # uL
water_total_vol = 100 # uL

number_of_reactions=length(fragment_names)


# Taking stuff

take
  buffer_stock = item unique(buffers)
  bsa_stock = item bsa
  plasmid_stocks = item unique(plasmids)
end


# Taking enzymes

step
  description: "Prepare ice for enzymes"
  check: "Get ice or ice-cold sample holder"
  note: "All enzymes must be kept on ice during entire protocol"
end

# Taking enzymes
take
  enzyme_stocks_1 = item unique(enzymes1)
  enzyme_stocks_2 = item unique(enzymes2)
end




step
  description: "Label reaction tubes"
  check: "Grab a 12 strip-well PCR tube, rest it in a green PCR tube rack. Numbers should face you."
  check: "Grab a cap for 12 strip-well PCR tube, put aside."
  check: "Label the right most well with the letters %{initials}"
  check: "Label the left most well with the letter A"
  note: "These wells will be refered to as 1 - 12"
end

if length(plasmids) > 12
  step
    description: "Label reaction tubes"
    check: "Grab a second 12 strip-well PCR tube, rest it in a green PCR tube rack. Numbers should face you."
    check: "Grab a cap for 12 strip-well PCR tube, put aside."
    check: "Label the left most well with the letters %{initials}13"
    check: "Label the right most well with the letter %{initials}24"
    note: "These wells will be refered to as 13 - 24"
  end
end

if length(plasmids) > 24
  step
    description: "Label reaction tubes"
    check: "Grab a third 12 strip-well PCR tube, rest it in a green PCR tube rack. Numbers should face you."
    check: "Grab a cap for 12 strip-well PCR tube, put aside."
    check: "Label the right most well with the letters %{initials}"
    check: "Label the left most well with the letter C"
    note: "These wells will be refered to as 25 - 36"
  end
end

step
  description: "Label reaction tubes"
  check: "If not already labeled, label tube %{number_of_reactions} with initials %{initials}."
  check: "Rip off any other tubes to the right."
end



# Adding water
# -----------------------------------------------------------------------------

# Initializing counter for cycling through reaction tubes
counter = 0

# Cycling through reaction tubes
while counter < number_of_reactions
  label = counter + 1        # Label starts from 1
  
  plasmid_id = plasmids[counter]
  plasmid = FindSample(plasmid_stocks, plasmid_id)
  
  # Calculating amount of water to add. This depends how much DNA must be added
  dna_stock_conc = plasmid[:data][:concentration]  # ng/uL
  dna_stock_vol = dna_mass / dna_stock_conc                       # uL
  water_vol = water_total_vol - dna_stock_vol - buffer_vol - enzyme_vol - bsa_vol
  
  step
    description: "Add molecular grade water to the tubes"
    check: "Add %{water_vol} uL of water molecular grade to the tube %{label}."
  end
  counter = counter + 1     # Update counter for the next tube
end



# Adding BSA
# -----------------------------------------------------------------------------

step
  description: "Add BSA"
  check: "Add %{bsa_vol} µl of BSA to every tube."
end



# Adding NEB buffers
# -----------------------------------------------------------------------------

# Initializing counter for cycling through reaction tubes
counter = 0

# Cycling through reaction tubes
while counter < number_of_reactions
  label = counter + 1                # Label starts from 1
  
  buffer_id = buffers[counter]
  
  step
    description: "Add proper NEB buffer to the tubes"
    check: "Add %{buffer_vol} uL of NEB buffer from tube %{buffer_id} to the reaction tube %{label}."
  end
  counter = counter + 1
end



# Adding plasmids
# -----------------------------------------------------------------------------

# Initializing counter for cycling through reaction tubes
counter = 0

# Cycling through reaction tubes
while counter < number_of_reactions
  label = counter + 1    # Label starts from 1
  
  plasmid_id = plasmids[counter]
  plasmid = FindSample(plasmid_stocks, plasmid_id)
  
  dna_stock_conc = plasmid[:data][:concentration]  # ng/uL
  dna_stock_vol = dna_mass / dna_stock_conc                       # uL
  
  step
    description: "Add plasmids to be digested"
    check: "Add %{dna_stock_vol} uL of plasmid %{plasmid_id} into tube %{label}."
  end
  counter = counter + 1
end



# Adding enzyme No 1
# -----------------------------------------------------------------------------

# Initializing counter for cycling through reaction tubes
counter = 0

# Cycling through reaction tubes
while counter < number_of_reactions
  label = counter + 1                # Label starts from 1
  enzyme = enzymes1[counter]
  
  step
    description: "Add first enzyme"
    check: "Add %{single_enzyme_vol} uL of enzyme %{enzyme} into tube %{label}."
  end
  counter = counter + 1
end



# Adding enzyme No 2
# -----------------------------------------------------------------------------

# Initializing counter for cycling through reaction tubes
counter = 0

# Cycling through reaction tubes
while counter < number_of_reactions
  label = counter + 1                # Label starts from 1
  enzyme = enzymes2[counter]
  
  step
    description: "Add second enzyme"
    check: "Add %{single_enzyme_vol} uL of enzyme %{enzyme} into tube %{label}."
  end
  counter = counter + 1
end



# Incubation steps

step
  description: "Finish handling reactions"
  check: "Close all tubes with caps"
end

step
  description: "Incubation"
  check: "Place all closed tubes into incubator 37 C, which is at B15.320"
  check: "Double check that they are labelled with %{initials} and today's date."
end



# Produce resulted fragments

# Initializing counter for cycling through reaction tubes
counter = 0

# Cycling through reaction tubes
while counter < number_of_reactions
  label = counter + 1                # Label starts from 1
  
  plasmid_id = plasmids[counter]
  plasmid = FindSample(plasmid_stocks, plasmid_id)
  enzyme1 = enzymes1[counter]
  enzyme2 = enzymes2[counter]
  
  produce
    q = 1 "Digested Plasmid" from plasmid
    location: "B15.320"
    data
      from: plasmid_id
      enzyme_cut_1: enzyme1
      enzyme_cut_2: enzyme2
    end
  end
  
  counter = counter + 1
end


# Releasing stuff
release buffer_stock
release bsa_stock
release plasmid_stocks
release enzyme_stocks_1
release enzyme_stocks_2
