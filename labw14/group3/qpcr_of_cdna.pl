argument
  fragment1: sample,"The cDNA sample to run in qPCR"
  fragment2: sample,"The cDNA sample to run in qPCR"
  enzyme: sample, "The iTaq Universal SYBR Green Supermix"
  primer_forward1: sample, "The forward primer"
  primer_reverse1: sample, " The reverse primer"
  primer_forward2: sample, "The forward primer"
  primer_reverse2: sample, " The reverse primer"
  primer_forward3: sample, "The forward primer"
  primer_reverse3: sample, " The reverse primer"
  primer_forward4: sample, "The forward primer"
  primer_reverse4: sample, " The reverse primer"
end

take
  x = item fragment1
  y = item fragment2
  sybr = item enzyme
  pf1 = item primer_forward1
  pr1 = item primer_reverse1
  pf2 = item primer_forward2
  pr2 = item primer_reverse2
  pf3 = item primer_forward3
  pr3 = item primer_reverse3
  pf4 = item primer_forward4
  pr4 = item primer_reverse4
end

information "qPCR of cDNA - Prep and Run"

step
  description: "Thaw Frozen Components"
  bullet: "Place the iTaq SYBR Green Supermix in covered box - protected from light"
  bullet: "Allow the primers and the SYBR Green to thaw"
end

step
  description: "Dilution of cDNA (if necessary)"
  bullet: "Label a 1.5 mL tube to contain diluted cDNA sample"
  #bullet: "Transfer 1 μL of cDNA to new tube"
  #bullet: "Add __ μL of Molecular Grade Water to new tube"
  bullet: "Dilute the cDNA to a concentration of about 50 ng/μL"
  bullet: "Stir dilution with pipette tip or vortex"
end

step 
  description: "Prepare Enough Master Mix for All Reactions"
  check: "Obtain a 96 well qPCR Plate and Optically Transparent Film"
  bullet: "Add 10 μL of iTaq SYBR Green Supermix to 6 qPCR plate wells."
end

step
  bullet: "Add 4.5 μL of the Forward Primer (sample id: %{primer_forward1}"
  bullet: "Add 4.5 μL of the Reverse Primer (sample id: %{primer_reverse1}"
  note: "Be sure to use proper sterile technique to guarantee accuracy of results."
end

step
  bullet: "Add 4.5 μL of the Forward Primer (sample id: %{primer_forward2}"
  bullet: "Add 4.5 μL of the Reverse Primer (sample id: %{primer_reverse2}"
  note: "Be sure to use proper sterile technique to guarantee accuracy of results."
end

step
  bullet: "Add 4.5 μL of the Forward Primer (sample id: %{primer_forward3}"
  bullet: "Add 4.5 μL of the Reverse Primer (sample id: %{primer_reverse3}"
  note: "Be sure to use proper sterile technique to guarantee accuracy of results."
end

step
  bullet: "Add 4.5 μL of the Forward Primer (sample id: %{primer_forward4}"
  bullet: "Add 4.5 μL of the Reverse Primer (sample id: %{primer_reverse4}"
  note: "Be sure to use proper sterile technique to guarantee accuracy of results."
end

step
  description: "Addition of Diluted cDNA Samples"
  check: "Add 1 μL of diluted cDNA (sample id: %{fragment1} to well A1"
  check: "Stir mixture with pipette tip"
  check: "Add 1 μL of diluted cDNA (sample id: %{fragment1} to well B1"
  check: "Stir mixture with pipette tip"
  check: "Add 1 μL of diluted cDNA (sample id: %{fragment1} to well C1"
  check: "Stir mixture with pipette tip"
end

step
  description: "Addition of Diluted cDNA Samples (continued)"
  check: "Add 1 μL of diluted cDNA (sample id: %{fragment2} to well D1"
  check: "Stir mixture with pipette tip"
  check: "Add 1 μL of diluted cDNA (sample id: %{fragment2} to well E1"
  check: "Stir mixture with pipette tip"
  check: "Add 1 μL of diluted cDNA (sample id: %{fragment2} to well F1"
  check: "Stir mixture with pipette tip"
end

step
  description: "you suck"
  bullet: "Seal the qPCR plate wells with optically transparent film"
  bullet: "Vortex/Spin to ensure thorough mixing and remove any air bubbles"
end

step
  description: "Load qPCR Plate"
  bullet: "Move the qPCR over to the BioRad CFX96 ThermoCycler ___"
  bullet: "Open the qPCR software"
  bullet: "Use computer software to open the lid"
  bullet: "Place the tray into the thermocycler with well A1 in the upper left corner"
  bullet: "Click the Close Lid Button on the computer"
end

step 
  check: "Label the wells in the software to correspond with Reaction Mixtures in the plate"
  check: "Select the ____ program in the software."
  check: "Click the Start Run button to begin program."
  note: "Program will take approximately 45-50 minutes"
end

step
  bullet: "Analyze the data after run"
  check: "Save the data to the folder on the desktop on the computer"
end

release [x[0], y[0], sybr[0], pf1[0], pr1[0], pf2[0], pr2[0], pf3[0], pr3[0], pf4[0], pr4[0]]
