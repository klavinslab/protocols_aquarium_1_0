information "Pour plates from 800 mL of liquid state agar media."

step
  getdata
    media_type: string, "Media choice", ["YPAD", "SDO -His", "SDO -Leu",
                                         "SDO -Trp", "SDO -Ura"]
  end
end

object_type = ""  # Initialize global variable
plate_name = ""  # Initialize global variable
drop_out_description = ""  # Initialize global variable
plate_color = ""  # Initialize global variable
if media_type == "YPAD"
  object_type = "800 mL YPAD agar (sterile)"
  plate_name = "YPAD Plate (sterile)"
  plate_color = "BLACK"
elsif media_type == "SDO -His"
  object_type = "800 mL SDO -His agar (sterile)"
  plate_name = "SDO -His Plate (sterile)"
  drop_out_description = "-His"
  plate_color = "RED"
elsif media_type == "SDO -Leu"
  object_type = "800 mL SDO -Leu agar (sterile)"
  plate_name = "SDO -Leu Plate (sterile)"
  drop_out_description = "-Leu"
  plate_color = "BLUE"
elsif media_type == "SDO -Trp"
  object_type = "800 mL SDO -Trp agar (sterile)"
  plate_name = "SDO -Trp Plate (sterile)"
  drop_out_description = "-Trp"
  plate_color = "GREEN"
elsif media_type == "SDO -Ura"
  object_type = "800 mL SDO -Ura agar (sterile)"
  plate_name = "SDO -Ura Plate (sterile)"
  drop_out_description = "-Ura"
  plate_color = "PURPLE"
end

take
  agar_bottle = 1 object_type
  plates = 40 "Petri Dish"
end

step
  description: "Lay out plates on workspace."
  note: "Lay out plates individually on your workspace, lid side up, in preparation for pouring."
end

step
  description: "Pour 25 mL of media into each plate."
  note: "Uncap the molten agar media bottle. Pour agar slowly into a plate (pour into the same location on the plate for the entire pour). It should take approximately 3 seconds for agar to cover the bottom of the plate. Continue pouring at the same rate for 1 more second and you will have poured approximately 25 mL."
  getdata
    plates_poured: number, "Enter the number of plates you poured (varies depending on average pour volume)."
  end
end

step
  description: "Mark The side of each plate with %{plate_color}"
  note: "Use a permanent sharpie marker for this"
end

step
  description: "Let plates cool."
  note: "Let the plates cool until solid. You can verify that the plates are cool because the agar becomes opaque. If you keep them separate and unstacked, they will cool much faster and more evenly. This should take 10-20 minutes."
end

step
  description: "Stack and label."
  note: "Once the plates are cool, invert all of them lid down. Stack them (lid down) in groups of about 20. Label a piece of lab tape with the following, then place it on top of the stack:"
  bullet: "%{media_type}"
  bullet: "your initials"
  bullet: "the date"
end

step
  description: "Place in the 30 degree yeast incubator."
  note: "Place the plates in the 30 degree yeast incubator at A1.110 to dry overnight."
end

poured_plates = []
ii = 0
while ii < plates_poured
  poured_plates = append(poured_plates, plates[ii])
  ii = ii + 1
end

empty_plates = []
jj = plates_poured
while jj < 40
  empty_plates = append(empty_plates, plates[jj])
  jj = jj + 1
end

produce silently
  produced_plates = plates_poured plate_name
  release poured_plates
end

modify
  produced_plates
  location: "A1.110"
end

if plates_poured < 40
  release empty_plates
end

produce
  empty_bottle = 1 "1 L Bottle (dirty)"
  release agar_bottle
  location: "A8.310"
end
