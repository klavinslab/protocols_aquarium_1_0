information "This protocol describes how to move bacteria plates from the yeast incubator to refrigerator R1."

step
  description: "Choose the type of bacteria plates you are moving."
  getdata
    media_type: string, "Media Types:", ["YPAD Plate (sterile)",
                                         "SDO -His Plate (sterile)",
                                         "SDO -Leu Plate (sterile)",
                                         "SDO -Trp Plate (sterile)",
                                         "SDO -Ura Plate (sterile)"]
    number: number, "Enter the number of plates that are being moved"
  end
end


step
  description: "When selecting the location of plates:"
  note: "Always select from the location A1.110: This is the location of the yeast incubator."
end


take
  plates = number media_type
end

r1_shelf = "the second shelf from the top"
shelf_label = ""  # Initialize global variable
if media_type == "YPAD Plate (sterile)"
  shelf_label = "YPAD"
elsif media_type == "SDO -His Plate (sterile)"
  shelf_label = "SDO -His"
elsif media_type == "SDO -Leu Plate (sterile)"
  shelf_label = "SDO -Leu"
elsif media_type == "SDO -Trp Plate (sterile)"
  shelf_label = "SDO -Trp"
elsif media_type == "SDO -Ura Plate (sterile)"
  shelf_label = "SDO -Ura"
end

step
  description: "Move the plates to the refrigerator R1 located at B0.110 on %{r1_shelf}"
  note: "Move the plates to the section labeled %{shelf_label}, placing them behind the older stack(s) of plates."
end

produce silently
  produced_plates = number media_type
  release plates
end

modify
  produced_plates
  location: "B0.110"
end
