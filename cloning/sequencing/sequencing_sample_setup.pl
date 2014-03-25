#this protocol describes how to set up a sequencing reaction to send to genewiz


argument 
  plasmids: sample("Plasmid") array, "Enter the template plasmids you wish to create a sequencing reaction with"
  plasmids_lengths: number array, "Enter the length in basepairs of the above plasmids" 
  concentrations: number array, "Enter the concentration of the above plasmid samples in ng/µl"
  primers: sample("Primer") array, "Enter the primers you wish to use to set up a sequencing reaction"
  initials: string, "Your initials"
end

y=length(plasmids)

take
  plasmids_ids=item unique(plasmids)
end

take
  primers_ids=item unique(primers)
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
if length(plasmids_ids) > 12
  step
    description: "Grab a second 12 strip-well PCR tube and cap, and rest it in a green PCR tube rack. With the numbers FACING YOU, do the following:"
    check: "Label the right most well with the letters %{initials}13"
    check: "Label the left most well with the letter %{initials}24"
    note: "These wells will be refered to as 13 - 24"
  end
end
if length(plasmids_ids) > 24
  step
    description: "Grab a third 12 strip-well PCR tube and cap, and rest it in a green PCR tube rack. With the numbers FACING YOU, do the following:"
    check: "Label the right most well with the letters %{initials}25"
    check: "Label the left most well with the letter %{initials}36"
    note: "These wells will be refered to as 25 - 36"
  end
end
if length(plasmids_ids) > 36
  step
    description: "Grab a fourth 12 strip-well PCR tube and cap, and rest it in a green PCR tube rack. With the numbers FACING YOU, do the following:"
    check: "Label the right most well with the letters %{initials}37"
    check: "Label the left most well with the letter %{initials}48"
    note: "These wells will be refered to as 37 - 48"
  end
end
if length(plasmids_ids) > 48
  step
    description: "Grab a fourth 12 strip-well PCR tube and cap, and rest it in a green PCR tube rack. With the numbers FACING YOU, do the following:"
    check: "Label the right most well with the letters %{initials}49"
    check: "Label the left most well with the letter %{initials}60"
    note: "These wells will be refered to as 49 - 60"
  end
end


count1=0

DNA_req=plasmids_lengths/10  
plasmid_vol=[0]










