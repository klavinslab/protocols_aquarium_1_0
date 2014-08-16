##This protocol creates 50µl digests of yeast vectors to be integrated via transformation

argument
  initials: string, "Your initials or another 2-3 letter identifier for tube labeling"
  plasmids: sample("Plasmid") array, "Plasmids"
  pmei: sample("Enzyme"), "Tube of PMEI to be used."
  cutsmart: sample("Enzyme Buffer"), "Tube of Cutsmart to be used."
end

take
  cutsmart_stock = item cutsmart
  plasmid_stocks = item unique(plasmids)
end

number_plasmids=length(plasmids)

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
  description: "If not already labeled, label tube %{number_plasmids} %{initials} and rip off any other tubes to the right."
end

step
  description: "Add 5µl of Cutsmart Buffer to every tube"
end

step
  description: "Add 42µl of MGH2O to every tube"
end


count=0

while count<number_plasmids
  label=count+1
  plas=plasmids[count]
  step
    description: "Add 2µl of plasmid %{plas} into tube %{label}"
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

digested_plasmids_ids=[]
x=0
while x < number_plasmids
  
  counter2 = 0
  while counter2 < length(plasmid_stocks)
    temp = plasmid_stocks[counter2]
    if plasmids[x] == temp[:id]
      plasmid = plasmid_stocks[x]
    end
    counter2 = counter2 + 1
  end
  
  produce
    q = 1 "Digested Plasmid" from plasmid
    location: "B15.320"
  end
  digested_plasmids_ids=append(digested_plasmids_ids,q[:id])
  x = x+1
end

release pmei_stock
release plasmid_stocks
release cutsmart_stock

log
  return: {digested_plasmids_ids: digested_plasmids_ids}
end
