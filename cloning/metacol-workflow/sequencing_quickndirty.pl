#this protocol describes how to set up a sequencing reaction to send to genewiz


argument 
  plasmids: sample("Plasmid") array, "Enter the template plasmids you wish to create a sequencing reaction with"
  plasmids_lengths: number array, "Enter the length in basepairs of the above plasmids" 
  primers_entered: sample("Primer") array, "Enter the primers you wish to use to set up a sequencing reaction"
  initials: string, "Your initials"
  groups: number array, "Enter number of sequencing reactions you want set up for each plasmids. Eg(2 for the first, 3 for the second etc)"
  number_colonies: number, "Enter how many colonies you want to sequence from each plate."
  tracking_no: string, "Enter the tracking number of your Genewiz order"
end

number_seq_rxs = length(primers_entered)*number_colonies


take
  plasmids_ids=item unique(plasmids)
end

take
  primers_ids=item unique(primers_entered)
end

step
  description: "This protocol sets up a set of sequencing reactions to be sent to Genewiz for analysis."
end


step
  description: "Grab a 12 strip-well PCR tube and cap, and rest it in a green PCR tube rack. With the numbers FACING YOU, do the following:"
  check: "Label the right most well with the letters %{initials}01"
  check: "Label the left most well with the letter %{initials}12"
  note: "These wells will be refered to as 1 - 12"
end
if number_seq_rxs > 12
  step
    description: "Grab a second 12 strip-well PCR tube and cap, and rest it in a green PCR tube rack. With the numbers FACING YOU, do the following:"
    check: "Label the right most well with the letters %{initials}13"
    check: "Label the left most well with the letter %{initials}24"
    note: "These wells will be refered to as 13 - 24"
  end
end
if number_seq_rxs > 24
  step
    description: "Grab a third 12 strip-well PCR tube and cap, and rest it in a green PCR tube rack. With the numbers FACING YOU, do the following:"
    check: "Label the right most well with the letters %{initials}25"
    check: "Label the left most well with the letter %{initials}36"
    note: "These wells will be refered to as 25 - 36"
  end
end
if number_seq_rxs > 36
  step
    description: "Grab a fourth 12 strip-well PCR tube and cap, and rest it in a green PCR tube rack. With the numbers FACING YOU, do the following:"
    check: "Label the right most well with the letters %{initials}37"
    check: "Label the left most well with the letter %{initials}48"
    note: "These wells will be refered to as 37 - 48"
  end
end
if number_seq_rxs > 48
  step
    description: "Grab a fourth 12 strip-well PCR tube and cap, and rest it in a green PCR tube rack. With the numbers FACING YOU, do the following:"
    check: "Label the right most well with the letters %{initials}49"
    check: "Label the left most well with the letter %{initials}60"
    note: "These wells will be refered to as 49 - 60"
  end
end

number_unique_plasmids = length(plasmids)/number_colonies
H20_req=[0]
DNA_req=[0]
plasmid_vol=[0]
tubes=[0]

count1=0
index=0
while count1 < number_unique_plasmids
  count2=0
  while count2 < number_colonies
    DNA_req[index]=plasmids_lengths[count1]/10
    plasmid_vol[index] = ceil(DNA_req[count1]/250)
      if plasmid_vol[index]==0
        plasmid_vol[index]=1
      end
    H20_req[index]=12.5-plasmid_vol[count1]
    count2=count2+1
    index=index+1
    tubes[index]=index+1
  end
  count1=count1+1
end

tbl = [["Tube Number", "H2O Volume"]]
ii = 0 
while ii<number_seq_rxs
  tbl = append(tbl,[ii+1,H20_req[ii]])
  ii = ii+1
end

step
  description: "Refer to the table for the volume of water to add to each tube"
  table: tbl
end

i1=0
index=0
tbl1 = [["Tube Number", "Primer ID Number"]]
while i1<number_unique_plasmids
  i2=0
  while i2<number_colonies
    i3=0
    while i3 < groups[i1]
      tbl1 = append(tbl1,[i1+i2+i3+1,primers_entered[index+i3]])
      i3=i3+1
    end
    i2=i2+1
  end
  index = index+groups[i1]-1
  i1 = i1+1
end


step  
  description: "Add 2.5µl of the identified primer into the corresponding tube."
  table: tbl1
end

i2=0
index = 0
tbl2 = [["Tube Number", "Plasmid ID", "Plasmid Volume in µl"]]
while i2<number_unique_plasmids
  i3=0
  while i3<number_colonies
    tbl2 = append(tb12,[index,plasmids[i2], plasmid_vol[index]])
    i3=i3+1
    index = index+1
  end
  i2 = i2+1
end

step
  description: "Add the described plasmid volume of given plasmids to each tube."
  table: tbl2
end


step
  check: "Cap all strip well tubes"
  check: "Write %{tracking_no} on a small slip of paper."
  check: "Place all of the strip well tubes and the small strip of paper in a small plastic bag above B14.310 and place the bag into the Genewiz collection box"
  check: "Email grad student with initials %{initials} when the sequencing reaction was submitted by."
end

release plasmids_ids
release primers_ids
