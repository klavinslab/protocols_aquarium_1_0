argument
  ladder: sample, "Choose 1kb ladder stock"
end
take
  ladder_stock: ladder
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
# note: "Keep the tube on the bench to use in the next protocol. (no need to edit the location below)"
# location: "Bench"
end

release ladder_stock[0]
  
