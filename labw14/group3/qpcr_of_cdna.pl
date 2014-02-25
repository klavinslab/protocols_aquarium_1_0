argument
  fragment: sample,"The cDNA sample to run in qPCR"
  enzyme: object, "The iTaq Universal SYBR Green Supermix"
  primer_forward: sample, "The forward primer"
  primer_reverse: sample, " The reverse primer"
end

take
  y = item fragment
  sybr = item enzyme
  pf = item primer_forward
  pr = item primer_reverse
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
  bullet: "Transfer 1 μL of cDNA to new tube"
  bullet: "Add __ μL of Molecular Grad Water to new tube"
  bullet: "Stir dilution with pipette tip or vortex"
end

step 
  description: "Prepare Enough Master Mix for All Reactions"
  bullet: "Add 10 μL of iTaq SYBR Green Supermix to each qPCR plate well for the number of total reactions."
  bullet: "Add __ μL of the Forward Primer"
  bullet: "Add __ μL of the Reverse Primer"
  bullet: "Stir the mixture with your pipette tip"
  note: "Be sure to use proper sterile technique to guarantee accuracy of results."
end

step
  description: "Addition of Diluted cDNA Samples"
  bullet: "Add 1 μL of diluted cDNA to its corresponding wells in qPCR plate"
  note: "Total cDNA added should be around 50 ng"
  bullet: "Stir mixture with pipette tip"
end

step
  bullet: "Seal the qPCR plate wells with optically transparent film"
  bullet: "Vortex/Spin to ensure thorough mixing and remove any air bubbles"
end

step
  description: "Load qPCR Plate"
  bullet: "Move the qPCR over to the BioRad CFX96 ThermoCycler"
  bullet: "Use computer software to open the lid"
  bullet: "Place the tray into the thermocycler with well A1 in the upper left corner"
  bullet: "Click the Close Lid Button on the computer"
end

step 
  bullet: "Label the wells in the software to correspond with Reaction Mixtures in the plate"
  bullet: "Select the ____ program in the software."
  bullet: "Click the Start Run button to begin program."
  note: "Program will take approximately 45-50 minutes"
end

step
  bullet: "Analyze the data after run"
end
