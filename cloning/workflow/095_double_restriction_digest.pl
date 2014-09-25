##This protocol does double digestion of a DNA sample
##Every DNA sample is digested with 2 different enzymes.


# Plasmid concentration I'm getting from plasmid sample - to be done.
# DNA amount should be in grams or mols.


argument
  initials: string, "Your initials or another 2-3 letter identifier for tube labeling"
  plasmids: sample("Plasmid") array, "Plasmids"
  enzymes1: sample("Enzyme") array, "Enzyme tube to be used as first enzyme. \nCheck enzymes for compatibility at NEB site https://www.neb.com/tools-and-resources/interactive-tools/double-digest-finder"
  enzymes2: sample("Enzyme") array, "Enzyme tube to be used as second enzyme. \nCheck enzymes for compatibility at NEB site https://www.neb.com/tools-and-resources/interactive-tools/double-digest-finder"
  bsa: sample("Enzyme Buffer"), "Tube of BSA to be used"
  buffers: sample("Enzyme Buffer") array, "Tube of buffer for restriction digest reaction.\nCheck which buffer to use at NEB site https://www.neb.com/tools-and-resources/interactive-tools/double-digest-finder "
end


# Initializing constants
dna_mass = 5      # ug
buffer_vol = 10   # uL
single_enzyme_vol = 4   # uL
enzyme_vol = single_enzyme_vol*2    # uL
bsa_vol = 0.5     # uL
water_total_vol = 100 # uL

number_of_reactions=length(plasmids)


# Taking stuff

take
  buffer_stock = item unique(buffers)
  bsa_stock = item bsa
  plasmid_stocks = item unique(plasmids)
end


# Taking enzymes

step
  description: "Prepare ice for plasmids"
  check: "Get ice or ice-cold sample holder"
  note: "All enzymes must be kept on ice during entire protocol"
end

# Taking enzymes
take
  enzyme_stocks_1 = item unique enzymes1
  enzyme_stocks_2 = item unique enzymes2
end




step
  description: "Grab a 12 strip-well PCR tube and cap, and rest it in a green PCR tube rack. With the numbers FACING YOU, do the following:"
  check: "Label the right most well with the letters %{initials}"
  check: "Label the left most well with the letter A"
  note: "These wells will be refered to as 1 - 12"
end

if length(plasmids) > 12
  step
    description: "Grab a second 12 strip-well PCR tube and cap, and rest it in a green PCR tube rack. With the numbers FACING YOU, do the following:"
    check: "Label the left most well with the letters %{initials}13"
    check: "Label the right most well with the letter %{initials}24"
    note: "These wells will be refered to as 13 - 24"
  end
end

if length(plasmids) > 24
  step
    description: "Grab a third 12 strip-well PCR tube and cap, and rest it in a green PCR tube rack. With the numbers FACING YOU, do the following:"
    check: "Label the right most well with the letters %{initials}"
    check: "Label the left most well with the letter C"
    note: "These wells will be refered to as 25 - 36"
  end
end

step
  description: "If not already labeled, label tube %{y} %{initials} and rip off any other tubes to the right."
end

count1=0



step
  description: "Add 5µl of NEB buffer %{N4} to every tube"
end

step
  description: "Add 0.5µl of BSA to every tube"
end

# Adding water
while count1<y
  label1=count1+1
  
  dna_stock_conc = plasmid_stocks[count1][:data][:concentration]  # ng/uL
  dna_stock_vol = dna_mass / dna_stock_conc                       # uL
  water_vol = water_total_vol - dna_stock_vol - buffer_vol - enzyme_vol - bsa_vol
  
  step
    description: "Add molecular grade water to the tubes"
    check: "Add %{water_vol} uL of water molecular grade to the tube %{label1}."
  end
  count1=count1+1
end

# Adding BSA
step
  description: "Add BSA"
  check: "Add %{bsa_vol} µl of BSA to every tube."
end

# Adding NEB buffers
while count1<y
  label1=count1+1
  buffer = buffers[count1]
  
  step
    description: "Add proper NEB buffer to the tubes"
    check: "Add %{buffer_vol} uL of NEB buffer %{buffer} to the tube %{label1}."
  end
  count1=count1+1
end

count=0

# Adding plasmids
while count<y
  label=count+1
  plas=plasmids[count]
  dna_stock_conc = plasmid_stocks[count1][:data][:concentration]  # ng/uL
  dna_stock_vol = dna_mass / dna_stock_conc                       # uL
  
  step
    description: "Add plasmids to be digested"
    check: "Add %{dna_stock_vol} uL of plasmid %{plas} into tube %{label}."
  end
  count=count+1
end

# Adding enzyme 1
while count<y
  label=count+1
  enzyme1 = enzyme_stocks_1[count]
  
  dna_stock_conc = plasmid_stocks[count1][:data][:concentration]  # ng/uL
  dna_stock_vol = dna_mass / dna_stock_conc                       # uL
  
  step
    description: "Add first enzyme"
    check: "Add %{enzyme_vol} uL of enzyme %{enzyme1} into tube %{label}."
  end
  count=count+1
end





step
  description: "Add 1µl of PMEI enzyme to every tube."
  note: "Make sure you are using good sterile technique when handling enyzmes."
end

step
  description: "Cap all strip well tubes"
end

step
  description: "Place the capped tubes into the 37ºc incubator B15.320. Make sure to label them them with %{initials} and today's date."
end

x=0
while x < y
  produce
    q = 1 "Digested Plasmid" from plasmids[x]
    location: "B15.320"
  end
  x = x+1
end

release pmei_stock
release plasmid_stocks
release bsa_stock
release N4
