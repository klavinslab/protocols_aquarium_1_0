argument
  YeastStrain_id: sample("Yeast Strain") array, "Yeast Strain"
end

take
  strains= item unique(YeastStrain_id)
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

if length(YeastStrain_id) > 12
  step
    description: "Grab a second 12 strip-well PCR tube and cap, and rest it in a green PCR tube rack. With the numbers FACING YOU, do the following:"
    check: "Label the left most well with your initials"
    check: "Label the right most well with the letter B"
    note: "These wells will be refered to as 13 - 24"
  end
end

if length(YeastStrain_id) > 36
  step
    description: "Grab a fourth 12 strip-well PCR tube and cap, and rest it in a green PCR tube rack. With the numbers FACING YOU, do the following:"
    check: "Label the left most well with your initials"
    check: "Label the right most well with the letter D"
    note: "These wells will be refered to as 37 - 48"
  end
end

if length(YeastStrain_id) > 48
  step
    description: "Grab a fourth 12 strip-well PCR tube and cap, and rest it in a green PCR tube rack. With the numbers FACING YOU, do the following:"
    check: "Label the left most well with your initials"
    check: "Label the right most well with the letter E"
    note: "These wells will be refered to as 49 - 60"
  end
end

y=length(YeastStrain_id)
x=y+1
sds=x*3
h20=x*27

step
  description: "Grab a 1.5ml tube and pipet in %{sds}µl of 2% sds solution into it, then pipet in %{h20} µl of molecular grade water. Mix the 1.5ml tube with the vortexter"
end

step
  description: "Pipet 30µl of the SDS mix created in the last step into stripwells 1 through %{y}."
end

z=0
while z< y 
  a=YeastStrain_id[z]
  f=z+1
  step
    description: "Take an unused small pipet tip and scrape a small amount of cells off a colony from %{a} and place it into well %{f}"
  end
  z=z+1
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

step
  description: "Label 1-%{y} more strip-well tubes in the manner described earlier in the protocol"
end

step
  description: "pipet 40µl of Molecular grade water into the new tubes 1 through %{y}"
end

step
  descriptoin: "pipet 10µl of the supernatant of the spundown strip-well tubes 1 through %{y} into the new corresponding strip-well tubes 1-%{y}"
end

release(strains)

count=0
  while count < y 
    produce
      q=1 "Lysate" of YeastStrain_id[count]
      location "benchtop"
    end
  count=count+1
end

  

