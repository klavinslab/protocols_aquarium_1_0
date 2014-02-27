argument
  fragment1: sample,"The cDNA sample to run in qPCR"
  fragment2: sample,"The cDNA sample to run in qPCR"
  enzyme: sample, "The iTaq Universal SYBR Green Supermix"
  primer_forward1: sample, "The forward primer ACT1"
  primer_reverse1: sample, " The reverse primer ACT1"
  primer_forward2: sample, "The forward primer ALG9"
  primer_reverse2: sample, " The reverse primer ALG9"
  primer_forward3: sample, "The forward primer gRNA_handle"
  primer_reverse3: sample, " The reverse primer gRNA_handle"
  primer_forward4: sample, "The forward primer eYFP"
  primer_reverse4: sample, " The reverse primer eYFP"
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
  #bullet: "Transfer 1 µL of cDNA to new tube"
  #bullet: "Add __ µL of Molecular Grade Water to new tube"
  bullet: "Dilute the cDNA to a concentration of about 50 ng/µL"
  bullet: "Stir dilution with pipette tip or vortex"
end

step 
  description: "Prepare Enough Master Mix for All Reactions"
  check: "Obtain a 96 well qPCR Plate and Optically Transparent Film"
  bullet: "Add 10 µL of iTaq SYBR Green Supermix to 6 qPCR plate wells."
end

step
  description: "Addition of Primers"
  bullet: "Add 4.5 µL of the Forward Primer (sample id: %{primer_forward1}) to well A1"
  bullet: "Add 4.5 µL of the Reverse Primer (sample id: %{primer_reverse1}) to well A1"
  note: "Be sure to use proper sterile technique to guarantee accuracy of results."
end

step
  description: "Addition of Primers"
  bullet: "Add 4.5 µL of the Forward Primer (sample id: %{primer_forward2}) to well A2"
  bullet: "Add 4.5 µL of the Reverse Primer (sample id: %{primer_reverse2}) to well A2"
  note: "Be sure to use proper sterile technique to guarantee accuracy of results."
end

step
  description: "Addition of Primers"
  bullet: "Add 4.5 µL of the Forward Primer (sample id: %{primer_forward3}) to well A3"
  bullet: "Add 4.5 µL of the Reverse Primer (sample id: %{primer_reverse3}) to well A3"
  note: "Be sure to use proper sterile technique to guarantee accuracy of results."
end

step
  description: "Addition of Primers"
  bullet: "Add 4.5 µL of the Forward Primer (sample id: %{primer_forward1}) to well A4"
  bullet: "Add 4.5 µL of the Reverse Primer (sample id: %{primer_reverse1}) to well A4"
  note: "Be sure to use proper sterile technique to guarantee accuracy of results."
end

step
  description: "Addition of Primers"
  bullet: "Add 4.5 µL of the Forward Primer (sample id: %{primer_forward2}) to well A5"
  bullet: "Add 4.5 µL of the Reverse Primer (sample id: %{primer_reverse2}) to well A5"
  note: "Be sure to use proper sterile technique to guarantee accuracy of results."
end

step
  description: "Addition of Primers"
  bullet: "Add 4.5 µL of the Forward Primer (sample id: %{primer_forward4}) to well A6"
  bullet: "Add 4.5 µL of the Reverse Primer (sample id: %{primer_reverse4}) to well A6"
  note: "Be sure to use proper sterile technique to guarantee accuracy of results."
end

step
  description: "Addition of Diluted cDNA Samples"
  check: "Add 1 µL of diluted cDNA (sample id: %{fragment1}) to well A1"
  check: "Stir mixture with pipette tip"
  check: "Add 1 µL of diluted cDNA (sample id: %{fragment1}) to well A2"
  check: "Stir mixture with pipette tip"
  check: "Add 1 µL of diluted cDNA (sample id: %{fragment1}) to well A3"
  check: "Stir mixture with pipette tip"
end

step
  description: "Addition of Diluted cDNA Samples (continued)"
  check: "Add 1 µL of diluted cDNA (sample id: %{fragment2}) to well A4"
  check: "Stir mixture with pipette tip"
  check: "Add 1 µL of diluted cDNA (sample id: %{fragment2}) to well A5"
  check: "Stir mixture with pipette tip"
  check: "Add 1 µL of diluted cDNA (sample id: %{fragment2}) to well A6"
  check: "Stir mixture with pipette tip"
end

step
  description: "Final Prep of qPCR Plate"
  bullet: "Seal the qPCR plate wells with optically transparent film"
  bullet: "Vortex/Spin to ensure thorough mixing and remove any air bubbles"
end

step
  description: "Load qPCR Plate"
  bullet: "Move the qPCR over to the BioRad CFX96 ThermoCycler at B9.340"
  bullet: "Open the qPCR software"
  bullet: "Use computer software to open the lid"
  bullet: "Place the tray into the thermocycler with well A1 in the upper left corner"
  bullet: "Click the Close Lid Button on the computer"
end

step 
  description: "Program Software and Run"
  check: "Label the wells in the software to correspond with Reaction Mixtures in the plate"
  check: "Select the qPCR_Template program located in the LabW14_qPCR_Protocols folder on the desktop."
  check: "Click the Start Run button to begin program."
  note: "Program will take approximately 45-50 minutes"
end

step
  bullet: "Analyze the data after run"
  check: "Save the data to the folder on the desktop on the computer"
end

release [x[0], y[0], sybr[0], pf1[0], pr1[0], pf2[0], pr2[0], pf3[0], pr3[0], pf4[0], pr4[0]]
