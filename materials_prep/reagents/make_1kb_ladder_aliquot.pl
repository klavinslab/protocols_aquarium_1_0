argument
  ladder: sample, "Choose 1kb ladder stock"
end

take
  ladder_stock = item ladder
  dye_stock = 1 "Gel Loading Dye Blue (6X)"
end

step
  description: "Label a 1.5 mL tube with you initials and date"
end

step
  description: "Add 30 µL of 1kb ladder stock %{ladder} into the labeled tube"
end

step
  description: "Add 50 µL of gel loading dye into the tube"
end

step
  description: "Add 220 µL of molecular grade water into the tube"
end

produce
  r = 1 "Ladder Aliquot" of "1 kb Ladder"
  note: "Write 1kb ladder aliquot on side of the tube"
end

release [ladder_stock[0],dye_stock[0]]
  
