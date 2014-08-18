argument
  YeastStrain_id: sample("Yeast Strain") array, "Yeast Strain"
  ColonyNumber: number, "Number of desired colonies from each plate to make lysate from"
end

take
  strains = item unique(YeastStrain_id)
end

step
  description: "This protocol makes a genomic DNA samples from lysed yeast cells in strip-well tubes"
end

step
  description: "Grab a 12 strip-well PCR tube and cap, and rest it in a green PCR tube rack. With the numbers FACING YOU, do the following:"
  check: "Label the left most well with your initials"
  check: "Label the right most well with the letter A"
  note: "These wells will be refered to as 1 - 12"
end

if length(YeastStrain_id)*ColonyNumber > 12
  step
    description: "Grab a second 12 strip-well PCR tube and cap, and rest it in a green PCR tube rack. With the numbers FACING YOU, do the following:"
    check: "Label the left most well with your initials"
    check: "Label the right most well with the letter B"
    note: "These wells will be refered to as 13 - 24"
  end
end

if length(YeastStrain_id)*ColonyNumber > 36
  step
    description: "Grab a fourth 12 strip-well PCR tube and cap, and rest it in a green PCR tube rack. With the numbers FACING YOU, do the following:"
    check: "Label the left most well with your initials"
    check: "Label the right most well with the letter D"
    note: "These wells will be refered to as 37 - 48"
  end
end

if length(YeastStrain_id)*ColonyNumber > 48
  step
    description: "Grab a fourth 12 strip-well PCR tube and cap, and rest it in a green PCR tube rack. With the numbers FACING YOU, do the following:"
    check: "Label the left most well with your initials"
    check: "Label the right most well with the letter E"
    note: "These wells will be refered to as 49 - 60"
  end
end

y=length(YeastStrain_id)

x=(ColonyNumber*y)+1
z=(ColonyNumber*y)
c=ColonyNumber
sds=x*3*1.1
h20=x*27*1.1

step
  description: "Grab a 1.5 ml tube and pipet in %{sds}µl of 2%% sds solution into it, then pipet in %{h20}µl of molecular grade water. Mix the 1.5ml tube with the vortexter"
end

step
  description: "Pipet 30µl of the SDS mix created in the previous step into wells 1 through %{z}"
end

j=0
w=0
well_id=1
colony_id=0

while j<y
  y=length(YeastStrain_id)
  a=YeastStrain_id[j]
  w=0
  while w<c
    colony_id=w+1
    step
      description: "With plate %{a} closed and upside down, find a large colony and label it %{colony_id}"
      note: "If you're already picked a colony for this strain make sure you pick a different one for this well"
    end
    step
      description: "Take an unused small pipet tip and scrape a small amount of cells off a colony from %{a} and place it into well %{well_id}"
      note: "If you're already picked a colony for this strain make sure you pick a different one for this well"
    end
    w=w+1
    well_id = well_id+1
  end
  j=j+1
end

step
  description: "Remove all of the pipets from the strip-well tubes and cap all the strip-well tubes."
  note: "after the tubes are capped vortex all of them"
end

step
  description: "Heat strip-well tubes in thermal cylcer at 90ºC for 5 minutes"
end

step
  description: "Remove strip-well tubes from thermal cycler"
end

step
  description: "Spin down the tubes in the benchtop centrifuge until a small pellet is visible at the bottom of the tubes"
end

j=y*ColonyNumber
step
  description: "Label %{j} more strip-well tubes in the manner described earlier in the protocol"
end

step
  description: "pipet 40µl of Molecular grade water into the new tubes."
end

step
  description: "pipet 10µl of the supernatant of the spundown strip-well tubes into the new corresponding strip-well tubes."
end


template_lysate_id=[]

ColonyCount=0
count=0
  while count < y 
  ColonyCount=0
    strain = strains[count]
      while ColonyCount < ColonyNumber
      produce
        q=1 "Lysate" from strain
        location: "Benchtop"
      end
     
      template_lysate_id=append(template_lysate_id,q[:id])
      
      ColonyCount=ColonyCount+1
    end
  count=count+1
end

  
release(strains)


log 
  return: {template_lysate_id: template_lysate_id}
end
