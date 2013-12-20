information "Pour LB plates from 200, 400, or 800 mL sources."


argument
  volume: number, "Enter the volume of LB Agar you are pouring in mL. Valid options are 200, 400, or 800."
  antibiotic: string, "Enter the type of antibiotic you want. Valid options are Amp, Kan, Chlor or None."
end


if volume != 200 && volume != 400 && volume != 800
  step
    description: "The LB Agar volume was incorrectly entered as %{volume}."
    getdata
      volume: number, "Enter the volume of LB Agar being poured.", [200, 400, 800]
    end
  end
end
if volume == 200
  bottle_type = "LB Agar: 200 mL"
elsif volume == 400
  bottle_type = "LB Agar: 400 mL"
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
  bottle = 1 bottle_type
  antibiotic_aliquots = antibiotic_number antibiotic_name
  hot_plate = 1 "Hot/Stir Plate"
end


step
  description: "Thaw the antibiotic aliquot(s)"
  note: "The aliquots should thaw at room temperature within 10 minutes. You can melt them faster by heating with your hand and vortexing."
end


step
  description: "Add %{antibiotic_volume} mL of %{antibiotic_name}"
  note: "Bottle setup: keep the bottle on the hot plate while adding antibiotics. Keep the bottle capped whenever you aren't immediately pipetting in antibiotics.\n\nPipetting: for each aliquot, spin on benchtop minifuge before opening. Using a 1000 µL micropipette, add a total of %{antibiotic_volume} mL of antibiotic solution to the LB Agar bottle. You can add 1000 µL at a time. Ampicillin sticks to the side of the pipet tip, but you can ignore small amounts of residue.\n\nRecap the bottle when finished."
  warning: "Make sure the media is at about 50°C (compare to the 50°C heat block using your hand)"
end


release hot_plate


step
  description: "Lay out plates on workspace."
  note: "Lay out plates individually on your workspace, lid side up, in preparation for pouring."
end


step
  description: "Pour 25 mL of media into each plate."
  note: "Uncap the molten agar media bottle. Pour agar slowly into a plate (pour into the same location on the plate for the entire pour). It should take approximately 3 seconds for agar to cover the bottom of the plate. Continue pouring at the same rate for 1 more second and you will have poured approximately 25 mL. Replace the petri dish lid and mark the side with a marker: purple for Amp, green for Kan, and blue for Chlor. Repeat for every plate."
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
  note: "Once the plates are cool, invert all of them lid down. Stack them (lid down) in groups of about 20. Label a piece of lab tape with LB, the antibiotic type, your initials, and the date. Apply the tape to the top plate on the stack."
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
    1 "1 L Bottle (dirty)"
  end
elsif volume == 400
  produce
    1 "500 mL Bottle (dirty)"
  end
else
  produce
    1 "250 mL Bottle (dirty)"
  end
end
