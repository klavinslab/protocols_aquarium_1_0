information "Pour LB plates from 200, 400, or 800 mL sources."


# TODO: Add the date to each plate (using stamp eventually)
argument
  n: number, "Enter the number of bottles you are pouring."
  volume: number, "Enter the volume of LB Agar you are pouring in mL. Valid options are 200, 400, or 800."
  antibiotic: string, "Enter the type of antibiotic you want. Valid options are Amp, Kan, Chlor or None."
  iptg: string, "Add IPTG? Enter Yes or No."
  atc: string, "Add aTc? Enter Yes or No."
  xgal: string, "Add X-gal? Enter Yes or No."
end


if volume != 200 && volume != 400 && volume != 800
  step
    description: "The LB Agar volume was incorrectly entered as %{volume}."
    getdata
      volume: number, "Enter the volume of LB Agar being poured.", [200, 400, 800]
    end
  end
end
if iptg != "Yes" || iptg != "No"
  step
    description: "The IPTG preference was incorrectly entered as %{iptg}."
    getdata
      iptg: string, "Add IPTG?", ["Yes", "No"]
    end
  end
end
if atc != "Yes" || iptg != "No"
  step
    description: "The aTc preference was incorrectly entered as %{atc}."
    getdata
      atc: string, "Add aTc?", ["Yes", "No"]
    end
  end
end
if xgal != "Yes" || iptg != "No"
  step
    description: "The X-gal preference was incorrectly entered as %{xgal}."
    getdata
      xgal: string, "Add X-gal?", ["Yes", "No"]
    end
  end
end


if volume == 200
  bottle_type = "200 mL LB Agar (molten)"
elsif volume == 400
  bottle_type = "400 mL LB Agar (molten)"
else
  bottle_type = "800 mL LB Agar (sterile)"
end


if antibiotic != "Amp" && antibiotic != "Kan" && antibiotic != "Chlor" && antibiotic != "None"
  step
    description: "The antibiotic preference was incorrectly entered as %{antibiotic}."
    getdata
      antibiotic: string, "Enter the type of antibiotic you want to add. If none, select 'None'.", ["Amp", "Kan", "Chlor", "None"]
    end
  end
end
if antibiotic == "Amp"
  antibiotic_name = "100X 1 mL Ampicillin Aliquot"
  antibiotic_volume = volume / 100.0
  antibiotic_number = antibiotic_volume
  product_name = "LB Amp Plate (sterile)"
elsif antibiotic == "Kan"
  antibiotic_name = "200X 1 mL Kanamycin Aliquot"
  antibiotic_volume = volume / 200.0
  antibiotic_number = antibiotic_volume
  product_name = "LB Kan Plate (sterile)"
elsif antibiotic == "Chlor"
  antibiotic_name = "1000X 1 mL Chloramphenicol aliquot"
  antibiotic_volume = volume / 1000.0
  antibiotic_number = 1
  # TODO: try ceil and/or see if ceil is necessary
  product_name = "LB Chlor Plate (sterile)"
end


take
  bottles = n bottle_type
end


if antibiotic != "None"
  take
    antibiotic_aliquots = antibiotic_number antibiotic_name
  end

  step
    description: "Thaw the antibiotic aliquot(s)"
    note: "The aliquots should thaw at room temperature within 10 minutes. You can melt them faster by heating with your hand and vortexing."
 end

  step
    description: "Add %{antibiotic_volume} mL of %{antibiotic_name}"
    note: "Repeat this step for each bottle. If possible, keep bottles at in a 37°C heat bath or incubator when not on a hot plate. Otherwise, work quickly.\n\nBottle setup: keep the bottle on the hot plate at B1.335 while adding antibiotics. Keep the bottle capped whenever you aren't immediately pipetting in antibiotics.\n\nPipetting: for each aliquot, spin on benchtop minifuge before opening. Using a 1000 µL micropipette, add a total of %{antibiotic_volume} mL of antibiotic solution to the LB Agar bottle. You can add 1000 µL at a time. Ampicillin sticks to the side of the pipet tip, but you can ignore small amounts of residue.\n\nRecap the bottle when finished."
    warning: "Make sure the media is at about 50°C (compare to the 50°C heat block using your hand)"
  end
end

if iptg == "Yes"
  take
    iptg_aliquot = 1 "IPTG 1M stock solution"
  end

  iptg_volume = 120.0 * volume / 800

  step
    description: "Add %{iptg_volume} µL of IPTG"
    note: "Repeat this step for each bottle. If possible, keep bottles at in a 37°C heat bath or incubator when not on a hot plate. Otherwise, work quickly.\n\nBottle setup: keep the bottle on the hot plate at B1.335 while adding IPTG. Keep the bottle capped whenever you aren't immediately pipetting in antibiotics.\n\nPipetting: for each aliquot, spin on benchtop minifuge before opening. Using a 1000 µL micropipette, add a total of %{iptg_volume} µL of antibiotic solution to the LB Agar bottle. You can add 1000 µL at a time.\n\nRecap the bottle when finished."
    warning: "Make sure the media is at about 50°C (compare to the 50°C heat block using your hand)"
  end
end


if atc == "Yes"
  # FIXME: add this to inventory
  take
    # FIXME: bioturk gives a useless message if number is omitted - it actually points to atomic expression error at next 'step'
    atc = 1 "aTc 100 mg/mL stock solution"
  end

  # FIXME: Figure out this calculation (currently is the one for IPTG)
  atc_volume = 120.0 * volume / 800

  step
    description: "Add %{atc_volume} µL of aTc"
    note: "Repeat this step for each bottle. If possible, keep bottles at in a 37°C heat bath or incubator when not on a hot plate. Otherwise, work quickly.\n\nBottle setup: keep the bottle on the hot plate at B1.335 while adding aTc. Keep the bottle capped whenever you aren't immediately pipetting in antibiotics.\n\nPipetting: for each aliquot, spin on benchtop minifuge before opening. Using a 1000 µL micropipette, add a total of %{atc_volume} µL of antibiotic solution to the LB Agar bottle. You can add 1000 µL at a time.\n\nRecap the bottle when finished."
    warning: "Make sure the media is at about 50°C (compare to the 50°C heat block using your hand)"
  end
end


if xgal == "Yes"
  take
    xgal_aliquot = 1 "xgal stock solution"
  end


  # FIXME: Figure out this calculation (currently is the one for IPTG)
  xgal_volume = 1600 * volume / 800

  step
    description: "Add %{xgal_volume} µL of X-gal"
    note: "Repeat this step for each bottle. If possible, keep bottles at in a 37°C heat bath or incubator when not on a hot plate. Otherwise, work quickly.\n\nBottle setup: keep the bottle on the hot plate at B1.335 while adding aTc. Keep the bottle capped whenever you aren't immediately pipetting in antibiotics.\n\nPipetting: for each aliquot, spin on benchtop minifuge before opening. Using a 1000 µL micropipette, add a total of %{xgal_volume} µL of antibiotic solution to the LB Agar bottle. You can add 1000 µL at a time.\n\nRecap the bottle when finished."
    warning: "Make sure the media is at about 50°C (compare to the 50°C heat block using your hand)"
  end
end


step
  description: "Lay out plates on workspace."
  note: "Lay out plates individually on your workspace, lid side up, in preparation for pouring."
end


step
  description: "Pour 25 mL of media into each plate."
  note: "Repeat this step for each bottle.\n\nUncap the molten agar media bottle. Pour agar slowly into a plate (pour into the same location on the plate for the entire pour). It should take approximately 3 seconds for agar to cover the bottom of the plate. Continue pouring at the same rate for 1 more second and you will have poured approximately 25 mL. Replace the petri dish lid and mark the side with a marker: purple for Amp, green for Kan, and blue for Chlor. Repeat for every plate."
  getdata
    plates_poured: number, "Enter the number of plates you actually poured."
  end
end


step
  description: "Let plates cool."
  note: "Let the plates cool until solid. You can verify that the plates are cool because the agar becomes opaque. If you keep them separate and unstacked, they will cool much faster and more evenly. This should take 10-20 minutes."
end


step
  description: "Stack and label."
  note: "Once the plates are cool, invert all of them lid down. Stack them (lid down) in groups of about 20. Label a piece of lab tape with LB, the antibiotic type if applicable, the inducer if applicable, X-gal if applicable. Apply the tape to the top plate on the stack."
end


step
  description: "Place in the 30 degree yeast incubator."
  note: "Place the plates in the 30 degree yeast incubator at A1.110 to dry overnight."
end


poured_plates = plates[0, plates_poured]
empty_plates = plates[plates_poured..-1]


if antibiotic == "None"
  produce
    poured_plates product_name
    location: "A1.110"
  end
else
  produce
    poured_plates product_name
    # FIXME: these aliquots are spent and should be disposed? But releasing isn't right either.
    release antibiotic_aliquots
    location: "A1.110"
  end
end


if plates_poured < 40
  release empty_plates
end


if volume == 200
  produce
    n "1 L Bottle (dirty)"
  end
elsif volume == 400
  produce
    n "500 mL Bottle (dirty)"
  end
else
  produce
    n "250 mL Bottle (dirty)"
  end
end
