##This protocol creates 50µl digests of yeast vectors to be integrated via transformation

argument
  initials: string, "Your initials or another 2-3 letter identifier for tube labeling"
  plasmids: sample("Plasmid") array, "Plasmids"
  Plasmids_conc: number array, "Plasmid DNA Concentrations in ng/µl"
  pmei: sample("Enzyme"), "Tube of PMEI to be used."
  bsa: sample("Enzyme Buffer"), "Tube of BSA to be used"
  NEB4: sample("Enzyme Buffer"), "Tube of NEB Buffer 4 to be used."
  DNA_amount: number, "The amount of DNA you would like to digest in ng/µl"
end

take
  N4 = item NEB4
  bsa_stock = item bsa
  plasmid_stocks = item unique(plasmids)
end

y=length(plasmids)

step
  description: "In the following step you will take PMEI enzyme out of the freezer. Make sure the enzyme is kept on ice for the duration of the protocol."
end

take
  pmei_stock = item pmei 
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
  description: "If not already labeled, label tube %{y}%{initials} and rip off any other tubes to the right."
end

count1=0

step
  description: "Add 5µl of NEB Buffer 4 to every tube"
end

step
  description: "Add 0.5µl of BSA to every tube"
end


while count1<y
  label1=count1+1
  plas_vol=ceil(DNA_amount/Plasmids_conc[count1])
  H20_vol=43.5-plas_vol
  step
    description: "Add %{H20_vol}µl of MGH2O into tube %{label1}"
  end
  count1=count1+1
end

count=0

while count<y
  label=count+1
  plas=plasmids[count]
  plas_vol=ceil(DNA_amount/Plasmids_conc[count])
  step
    description: "Add %{plas_vol}µl of plasmid %{plas} into tube %{label}"
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
  description: "Place the capped tubes into the 37ºc incubator B15.320"
end

x=0
while x < y
  produce
    q = 1 "Digested Plasmid" of plasmid_stocks[x]
    location: "B15.320"
  end
  x = x+1
end

release pmei_stock
release plasmid_stocks
release bsa_stock
release N4
