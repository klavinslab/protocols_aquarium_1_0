information "make competent cells for immediate use."

argument
  shocked_cells: sample , "heat shocked cells"
end

take
  cells = item shocked_cells
end
cells = cells[0]

step
  description: "NOTE"
  warning: "it is essential to keep EVERYTHING cold throughout this entire protocol; all cells and containers should be on ice when not in use."
end

step
  description: "Centrifuge at 4,600g  for 7 minutes at 4C"
  note: "while waiting for the centrifuge put five 1.5ml centrifuge tubes on ice."
end

step
  description: "Pour off supernatant"
  note: "use your P-1000 to remove any remaining supernatant but be careful not to desturb the pellet"
  warning: "Try not to leave any more supernatant than you have to (but don't disturb the pellet)"
end

step
  description: "Add 1ml ice cold sterile Mol-H2O"
  note: "use your P-1000 add 1ml ice cold Molecular biology grade H2O and resuspend the pellet by gently pipetting up and down."
end

step
  description: "Transfer into one of the prechilled 1.5ml centrifuge tube."
  note: "using your P-1000, transfer the culture form the 50ml falcon tube to the 1.5ml centrifuge tube on ice."
end

ii = 0
while ii<3
  step
    description: "Centrifuge at 10,000 g for 30s at 4c"
    note: "Centrifuge at 10,000g in refrigerated microcentrifuge for 30 s at 4 C."
  end

  step
    description: "Remove supernatant"
    note: "Using your P-1000, carefully aspirate the supernatant and suspend cells in 1 ml of ice-cold H2O."
    warning: "the pellet will be very fragile!  Try not to disturbe it."
  end

  if ii<2
    step
      description: "Add 1ml ice cold sterile Mol-H2O"
      note: "use your P-1000 add 1ml ice cold Molecular biology grade H2O and resuspend the pellet by gently pipetting up and down."
    end
  end
  ii = ii+1
end

step
  description: "Suspend the cell pellet in 200 ul of sterile cold Mol-H2O and keep on ice."
end

step
  description: "Make four aliquots"
  note: "Transfer 50 ul of the resuspended pellet into each of the four remaining pre-chilled 1.5ml centrifuge tubes.  Discard the source tube along with any remaining cells."
end

produce
  competent_cells = 4 "Electrocompetent aliquot" from cells
  location: "Bench"
  release cells
end

log
  return: { comp_cell_id: competent_cells[:id]}
end
