argument
  fragments_array: sample array,"The cDNA samples to run in qPCR"
  enzyme: sample, "The iTaq Universal SYBR Green Supermix"
  primers_forward_array: sample array, "The forward primers"
  primers_reverse_array: sample array, "The reverse primers"
  concentrations: number array, "The concentrations of cDNA"
end

n1 = length(fragments_array)
n2 = length(primers_forward_array)

take
  cdna_array = item fragments_array
  sybr = item enzyme
  forward_primers = item primers_forward_array
  reverse_primers = item primers_reverse_array
end

information "qPCR of cDNA - Prep and Run"

step
  description: "Thaw Frozen Components"
  bullet: "Place the iTaq SYBR Green Supermix in covered box - protected from light"
  bullet: "Allow the primers and the SYBR Green to thaw"
end

i = 0
while i<n1
  thisFragment = fragments_array[i]
  water = (concentrations[i] / 50)-1
  step
    description: "Dilution of cDNA"
    bullet: "Label a 1.5 mL tube with your intials, date, and the number %{i}"
    bullet: "Transfer 1 µL of cDNA with id {thisFragment[:id]} to new tube"
    bullet: "Add %{water} µL of Molecular Grade Water to the new tube"
    bullet: "The cDNA should be at a concentration of about 50 ng/µL"
    bullet: "Stir dilution with pipette tip or vortex briefly"
  end
  i=i+1
end

step 
  description: "Prepare Enough Master Mix for All Reactions"
  check: "Obtain a 96 well qPCR Plate and Optically Transparent Film"
  bullet: "Add 10 µL of iTaq SYBR Green Supermix to 6 qPCR plate wells (A1-A6)."
end

i = 1
while i < n2+1
  j = i-1
  thisForward = primers_forward_array[j]
  thisReverse = primers_reverse_array[j]
  step
    description: "Addition of Primers step %{i}"
    bullet: "Add 4.5 µL of the Forward Primer (sample id: %{thisForward}) to well A%{i}"
    bullet: "Add 4.5 µL of the Reverse Primer (sample id: %{thisReverse}) to well A%{i}"
    note: "Be sure to use proper sterile technique to guarantee accuracy of results."
  end
  i = i+1
end

#step
#  description: "Addition of Primers"
#  bullet: "Add 4.5 µL of the Forward Primer (sample id: %{primer_forward_array[1]}) to well A2"
#  bullet: "Add 4.5 µL of the Reverse Primer (sample id: %{primer_reverse_array[1]}) to well A2"
#  note: "Be sure to use proper sterile technique to guarantee accuracy of results."
#end

#step
#  description: "Addition of Primers"
#  bullet: "Add 4.5 µL of the Forward Primer (sample id: %{primer_forward_array[2]}) to well A3"
#  bullet: "Add 4.5 µL of the Reverse Primer (sample id: %{primer_reverse_array[2]}) to well A3"
#  note: "Be sure to use proper sterile technique to guarantee accuracy of results."
#end

#step
#  description: "Addition of Primers"
#  bullet: "Add 4.5 µL of the Forward Primer (sample id: %{primer_forward_array[0]}) to well A4"
#  bullet: "Add 4.5 µL of the Reverse Primer (sample id: %{primer_reverse_array[0]}) to well A4"
#  note: "Be sure to use proper sterile technique to guarantee accuracy of results."
#end

#step
#  description: "Addition of Primers"
#  bullet: "Add 4.5 µL of the Forward Primer (sample id: %{primer_forward_array[1]}) to well A5"
#  bullet: "Add 4.5 µL of the Reverse Primer (sample id: %{primer_reverse_array[1]}) to well A5"
#  note: "Be sure to use proper sterile technique to guarantee accuracy of results."
#end

#step
#  description: "Addition of Primers"
#  bullet: "Add 4.5 µL of the Forward Primer (sample id: %{primer_forward_array[3]}) to well A6"
#  bullet: "Add 4.5 µL of the Reverse Primer (sample id: %{primer_reverse_array[3]}) to well A6"
#  note: "Be sure to use proper sterile technique to guarantee accuracy of results."
#end
fragment0 = fragments_array[0]
step
  description: "Addition of Diluted cDNA Samples"
  bullet: "This is your gRNA strain (no. 1893)"
  check: "Add 1 µL of diluted cDNA (sample id: %{fragment0}) to well A1"
  check: "Stir mixture with pipette tip"
  check: "Add 1 µL of diluted cDNA (sample id: %{fragment0}) to well A2"
  check: "Stir mixture with pipette tip"
  check: "Add 1 µL of diluted cDNA (sample id: %{fragment0}) to well A3"
  check: "Stir mixture with pipette tip"
end

fragment1 = fragment_array[1]
step
  description: "Addition of Diluted cDNA Samples (continued)"
  bullet: "This is your eYFP strain (no. 965)"
  check: "Add 1 µL of diluted cDNA (sample id: %{fragment1}) to well A4"
  check: "Stir mixture with pipette tip"
  check: "Add 1 µL of diluted cDNA (sample id: %{fragment1}) to well A5"
  check: "Stir mixture with pipette tip"
  check: "Add 1 µL of diluted cDNA (sample id: %{fragment1}) to well A6"
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

release concat(cdna_array, sybr)
release concat(forward_primers, reverse_primers)
