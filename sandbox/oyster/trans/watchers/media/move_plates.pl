information "This protocol describes how to move bacteria plates from the yeast incubator to refrigerator R1."

step
  description: "Choose the type of bacteria plates you are moving."
  getdata
    media_type: string, "Media Types:", ["LB Amp Plate (sterile)",
                                         "LB Kan Plate (sterile)",
                                         "LB Chlor Plate (sterile)",
                                         "LB plus Amp plus Chlor",
                                         "LB plus Amp plus Kan"]
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

if media_type == "LB Amp Plate (sterile)"
  step
    description: "Move the plates to the Refrigerator R1, located at B0.110. Bacteria plates are on the second shelf from the top."
    note: "Move the plates to the row labeled 'LB + Amp', putting them behind the older stack(s) of plates."
  end
end

if media_type == "LB Kan Plate (sterile)"
  step
    description: "Move the plates to the Refridgerator R1, located at B0.110. Bacteria plates are on the second shelf from the top."
    note: "Move theplates to the row labeled 'LB + Kan', putting them behind the older stack(s) of plates."
  end
end

if media_type == "LB Chlor Plate (sterile)"
  step
    description: "Move the plates to the Refridgerator R1, located at B0.110. Bacteria plates are on the second shelf from the top."
    note: "Move the plates to the row labeled 'LB + Chlor', putting them behind the older stack(s) of plates."
  end
end

produce silently
  produced_plates = number media_type
  release plates
end

modify
  produced_plates
  location: "B0.110"
end
