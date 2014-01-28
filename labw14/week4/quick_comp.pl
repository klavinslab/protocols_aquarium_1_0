information "Make competent cells for immediate use."

argument
  shocked_cells: sample , "heat shocked cells"
end

take
  cells = item shocked_cells
end
cells = cells[0]

step
  description: "NOTE"
  warning: "It is essential to keep EVERYTHING cold throughout this entire protocol; all cells and containers should be on ice when not in use."
end

step
  description: "Centrifuge at 4,600 g  for 7 minutes at 4C"
  note: "While waiting for the centrifuge put five 1.5 mL tubes on ice."
end

step
  description: "Pour off supernatant"
  note: "Use your Pipettor P1000 (100-1000 μL pipettor) to remove any remaining supernatant but be careful not to desturb the pellet."
  warning: "Try not to leave any more supernatant than you have to (but don't disturb the pellet)"
end

step
  description: "Add 1 mL ice cold sterile molecular grade water"
  note: "Use your Pipettor P1000 (100-1000 μL pipettor) add 1 mL ice cold molecular grade water and resuspend the pellet by gently pipetting up and down."
end

step
  description: "Transfer into one of the prechilled 1.5 mL centrifuge tube."
  note: "Using your Pipettor P1000 (100-1000 μL pipettor), transfer the culture form the 50 mL falcon tube to the 1.5 mL centrifuge tube on ice."
end

ii = 0
while ii<3
  step
    description: "Centrifuge at 10,000 g for 30 s at 4 C"
    note: "Centrifuge at 10,000 g in refrigerated microcentrifuge for 30 s at 4 C."
  end

  step
    description: "Remove supernatant"
    note: "Using your Pipettor P1000, carefully aspirate the supernatant."
    warning: "The pellet will be very fragile! Try not to disturbe it."
  end

  if ii<2
    step
      description: "Add 1 mL ice cold sterile molecular grade water"
      note: "Use your Pipettor P1000 add 1 mL ice cold molecular grade water and resuspend the pellet by gently pipetting up and down."
    end
  end
  ii = ii+1
end

step
  description: "Suspend the cell pellet in 200 µL of sterile cold molecular grade water and keep on ice."
end

step
  description: "Make four aliquots"
  note: "Transfer 50 µL of the resuspended pellet into each of the four remaining pre-chilled 1.5 mL centrifuge tubes. Discard the source tube along with any remaining cells."
end

produce
  competent_cells = 1 "Electrocompetent aliquot" from cells
  note: "Write the same item number on all four aliquots"
  location: "Bench"
  release cells
end

log
  return: { comp_cell_id: competent_cells[:id]}
end
