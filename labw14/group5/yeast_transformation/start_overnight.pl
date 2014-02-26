argument
  transformed_yeast_plate: sample array, "A plate with yeast colonies"
end

num = length(transformed_yeast_plate)

step
  description: "About this project"
  note: "The goal is to transform a digested plasmid into yeast cells.
            You will be given a yeast strain deficient of HIS gene which codes for histidine amino acid.
            These yeast cells can only grow in media containing histidine, and will not grow in media lacking histidine.
            You will also be given a plasmid containing HIS gene. First you have to digest the plasmid.
            Then you will transform the digested plasmid into yeast cells.
            Then you will inoculate the digested cells on a clean his- agar plate deficient of histidine.
            Those cells that have incorporated HIS gene into the genome will grow on the plate.
            You will also make 'CONTROL' plate. In this case you will transform molecular grade water into yeast cells
            and then inoculate them on another clean his- agar plate deficient of histidine.
            In this case cells will not grow because they still lack HIS gene.
            Finally you will have one plate containing yeast cells and one plate without them."
end

step
 description: "This protocol describes how to make an overnight yeast suspension"
 warning: "You're going to make %{num} overnight suspension tubes."
end

take
  test_tube    = num "14 mL Test Tube"
  falcon_tube  = 1 "50 mL YPAD liquid aliquot (sterile)"
  plate        = item transformed_yeast_plate
end

if num == 1
  step
    description: "Preparing yeast overnight culture tubes"
    note: "Label a 14 ml glass tube with your name and today's date."
    warning: "Write only on transparent part of the tube. Don't write on the white label."
  end
else
  step
    description: "Preparing yeast overnight culture tubes"
    note: "Label  %{num}  14 ml glass tubes with your name and today's date."
    warning: "Write only on transparent part of the tubes. Don't write on the white label."
  end
end

ii  = 0
ind = 0
r   = []

while ii < length(transformed_yeast_plate)

  id_num = plate[ii][:id]
  
  ind = ii + 1

#  if ()
#    take another tube
#  end

  step
    description: "Making yeast overnight culture tube"
    bullet: "Take the labeled 14 mL glass tube."
    bullet: "Using P1000 pipettor pipet 2 mL of YPAD media into the tube."
  end

  step
    description: "Inoculating yeast overnight culture from a plate with id %{id_num}"
    bullet: "Take a yeast plate with id  %{id_num}."
    bullet: "Find a colony that is not touching any other colony."
    bullet: "Take a 200 μL tip (the one used by the 10-100 μL or 20-200 μL pipettor) by hand."
    bullet: "With the pipette tip, scrape up the colony and then mix it into one of the tube.
      Scrape the end of the tip against the wall of the tube below the liquid level to ensure the colony has been deposited."
  end

  produce
    y = 1 "Yeast Overnight Suspension" from plate[ii]
    release test_tube[ii]
    note: "Write the above id number on the tube's side. Place the tube in the 30 C Shaker Incubator located at B13.125"
    location:"B13.125"
  end

  r = append(r,y[:id])
  ii=ii+1
end

log
  return: { yeast_overnight_suspension: r }
end


release concat(falcon_tube, plate)

step
  description: "Now you have to wait 12-18 hours till the next protocol (Diluting an overnight yeast suspesnesion culture)."
end
