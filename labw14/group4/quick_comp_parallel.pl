#
# Author: Patrick Ma
# 2.17.2014
#
# A parallel version of the quick_comp protocol

BIG_CENTRIFUGE_SIZE = 8	# The max number of 50mL tubes the centrifuge can hold safely
SMALL__CENTRIFUGE_SIZE = 20	# max number of 1.5mL tubes the centrifuge can hold saely

information "Make competent cells for immediate use."

argument
  shocked_cells: sample array, "Array of heat shocked cells"
end

take
  cells = item shocked_cells
end
#cells = cells[0]	# i ddon't know what this is for...

step
  description: "Important notes before starting"
  note: "When chilling 1.5ml centrifuge tubes on ice use the aluminum block on an ice block, as you did for the transformation protocol."
  warning: "It is essential to keep EVERYTHING cold but NOT FROZEN throughout this entire protocol; all cells and containers should be on ice when not in use."
end

########## SETUP #########################

num_samples = length(shocked_cells)
extra_run = false

t = 5 * num_samples	# total number of tubes to set out

# calculate how many batches to run for 50mL tubes
num_repeats = num_samples / BIG_CENTRIFUGE_SIZE

if 0 != (num_samples /% BIG_CENTRIFUGE_SIZE) 
	extra_run = true
end

##################### Begin PROTOCOL ##################3

step
	description: "Centrifuge at 4,600 g for 7 minutes at 4C"
	note: "Centrifuge all of the 50 mL Falcon tubes. This may require running multiple batches depending on the number of samples."
	bullet: "Use the large centrifuge located at B14.330"
	check: "While waiting for all of the samples to run, place (%{num_samples}) 1.5mL tubes on ice. Label the tubes 1 through %{num_samples}"
	image: "put image of blue ice box here"
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
while ii < num_samples
cur_sample = cells[ii][:id]
cur_tube = ii + 1

	step
	  description: "Transfer sample %{cur_sample} into a prechilled 1.5 mL centrifuge tube."
		note: "Put the sample into the 1.5 mL tube labelled %{cur_tube} using your Pipettor P1000 (100-1000 µL pipettor)."
	end
	ii = ii + 1
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
	    description: "Remove the supernatant form each sample"
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

	# make the aliquots
electrocompetent_cells = []
kk = 0
while kk < num_samples
	
		step
		  description: "Make four aliquots"
		  note: "Taking the first /or next sample, transfer 50 µL of the resuspended pellet into four pre-chilled 1.5 mL centrifuge tubes. Discard the source tube along with any remaining cells."
			getdata
				sample_id: number, "What is the sample id number?"
			end
		end
		
		# IMPORTANT NOTE: this produces aliquots starting from the begginging of the sample array originally provided; Don't mix up the order of samples!
		produce
		  competent_cells = 4 "Electrocompetent aliquot" from cells[kk]
		  note: "Write the same item number on all four aliquots"
		  location: "Bench"
			data
				from: sample_id
			end
#			  release cells[kk]
		end
		electrocompetent_cells = append(electrocompetent_cells, competent_cells[:id])
		kk = kk + 1
end

log
  competent_cells: electrocompent_cells
end

release cells	# DEBUG
