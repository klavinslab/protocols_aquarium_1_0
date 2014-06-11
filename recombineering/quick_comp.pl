
information "Make competent cells for immediate use."

argument
  heat_shocked_cells: sample array, "Array of heat shocked cells"
end

take
  cells = item heat_shocked_cells
end

step
  description: "Important notes before starting"
  note: "When chilling 1.5ml centrifuge tubes on ice use the aluminum block on an ice block, as you did for the transformation protocol."
  warning: "It is essential to keep EVERYTHING cold but NOT FROZEN throughout this entire protocol; all cells and containers should be on ice when not in use."
end

########## SETUP #########################

num_samples = length(cells)
#work around for no assignment or while in side of steps
samp_ind = []
ii = 0
while ii<num_samples
  samp_ind = append(samp_ind,ii)
  ii=ii+1
end

##################### Begin PROTOCOL ##################3

step
  description: "Centrifuge at 4,600 g for 7 minutes at 4C"
  note: "Centrifuge all of the 50 mL Falcon tubes. This may require running multiple batches depending on the number of samples."
  bullet: "Use the large centrifuge located at B14.330"
  check: "While waiting for all of the samples to run, place (%{num_samples}) 1.5mL tubes on ice. Label the tubes 1 through %{num_samples}"
  image: "put image of blue ice box here"
end

take
  alrack = 1 "Aluminum Tube Rack"
  iceblock = 1 "Styrofoam Ice Block"
end

step
  description: "Pour off supernatant"
  note: "Use your Pipettor P1000 (100-1000 µL pipettor) to remove any remaining supernatant from each 50 mL tube. Be careful not to desturb the pellet."
  bullet: "Try not to leave any more supernatant than you have to (but don't disturb the pellet)"
  warning: "Use a clean tip for each tube"
end

step
  description: "Add 1 mL ice cold sterile molecular grade water"
  note: "Use your Pipettor P1000 (100-1000 µL pipettor) to add 1 mL ice cold molecular grade water to each 50 mL tube. Resuspend each pellet by gently pipetting up and down."
  warning: "Remember to use a new pipette tip with each tube!"
end
  
ii = 0

step
  description: "Transfer cells into a prechilled 1.5 mL centrifuge tube."
  note: "using the P1000:"
  foreach ii in samp_ind
    check: "Transfer cells from tube " + to_string(cells[ii][:id]) + " into the 1.5 mL tube labelled " + to_string(ii+1) + "."
  end
end

###### SECOND CENTRIFUGE SEQUENCE#### 
jj = 0
while jj < 3
  step
    description: "Centrifuge all samples at 10,000 g for 1 min at 4 C"
    note: "Place as many tubes as possible in the centrifuge. Depending on the number of samples, you may need to run the centrifuge multiple times."
    bullet: " Use the refrigerated microcentrifuge located at B14.320"
  end

  if 0 == jj
    tubes = 4 * num_samples
   
    step
      description: "Pre-chill 1.5 ml tubes"
      check: "For each sample in the centrifuge, put (4) 1.5 mL tubes on ice. There should be a total of %{tubes} tubes."
      image: "image of blue box here"
    end
  end

  step
    description: "Remove the supernatant from each sample"
    note: "Using your Pipettor P1000, carefully aspirate the supernatant from each centrifuged sample."
    warning: "The pellet will be very fragile! Try not to disturb it."
  end
  
  if jj<2
    step
      description: "Add 1 mL ice cold sterile molecular grade water"
      bullet: "Use your Pipettor P1000 add 1 mL ice cold molecular grade water to each tube"
      bullet: "Resuspend the pellet by gently pipetting up and down."
      warning: "Remember to use a clean pipette tip for each tube"
    end
  end
  jj = jj + 1
end

step
  description: "Resuspend each cell pellet in 200 µL of sterile cold molecular grade water and keep it cool."
end


######### make the aliquots ############
electrocompetent_cells = []
ii = 0
while ii < num_samples
  sample_id = cells[ii][:id]
  orig_id = cells[ii][:data][:original_id]
  
  ii = ii + 1
  step
    description: "Make four aliquots from Tube %{ii}"
    bullet: "Set your pipette to 50 µL"
    bullet: "Transfer 50 µL of liquid from Tube %{ii} into four pre-chilled 1.5 mL centrifuge tubes"
    bullet: "Give each tube the same label: f%{orig_id}"
    bullet: "Discard the source tube along with any remaining cells"
    warning: "Make sure the tubes stay on the chilled aluminum block."
  end
    
end

log
  return: {electrocompetent_cells: electrocompetent_cells}
  ice: iceblock[0]
  alrack: alrack[0]
end


#release [iceblock[0], alrack[0]]
release cells  
