##
## Adapted from existing protocol
##
 
argument
  log_cells: sample array, "The sample that you want to spec its concentration"
end

OD_min = 0.4
OD_max = 0.6

take
  y = item log_cells
  lb = 1 "50 mL LB liquid aliquot (sterile)"
end

information "Measure DNA concentration using Nanodrop spectrophotometer."

step
  description: "Take the cells and LB to the Nanodrop at location B3.405"
	note: "Log into Aquarium at a computer in the B3 aisle."
end

step
	description: "Navigate to 'Cell Culture' page"
	bullet: "If you are at the 'Cell Culture' page, proceed to the next step"
	note: "\nOtherwise:"
	bullet: "press the exit button and confirm that you wish to leave"
	bullet: "Select 'cell culture' mode"
	bullet: "The software will ask you to initialize the spectrophotometer. Follow the on screen instructions."
	bullet: "Initialize with 2ul molecular grade water and make sure to pipette a clean, bubble free drop or you may have to repeat the initialization."
	image: "cell_cultures_page"
end

ODs = []
foreach c in log_cells
	step
	  description: "Blank the Nanodrop"
	  check: "Set the wavelength to 250 nm"
	  check: "Wipe both lower (sensor) pedestal and the upper (lid) pedestal with Kimwipe."
	  check: "Using a pipette, carefully add 2 µL of LB Buffer to the lower pedestal." 
	  check: "Close the pedestal."
		bullet: "Visually check for a column of liquid between the two pedestals when closed."
	  check: "Click Blank in the software."
	end

	## What settings should we set the nanodrop to?

	step
	  description: "Measure your sample"
	  check: "Open the pedestal"
	  check: "Wipe both lower (sensor) pedestal and the upper (lid) pedestal with Kimwipe."
	  check: "Add 2 µL of your sample with id %{c} on the lower pedestal."
	  check: "Close the pedestal."
		bullet: "Visually check for a column of liquid between the two pedestals when closed."
	  check: "Click Measure in the software."
	end

	step
	  description: "Record the absorbance shown on the nanodrop computer"
	  getdata
		absorbance: number,"Write down the absorbance as shown on the computer" #Better description of where to find it?
	  end
	  image: "measurement"
	end
	OD = 10*absorbance
	ODs = append(ODs, OD)
	
	if OD < OD_min
		step
			description: "The OD is too low; the cells haven't grown enough!"
			note: "Reincubation is suggested. Click next."
		end

		step
			description: "Re-incubate the suspension."
			note: "let your instructor know the suspension needs more time to incubate."
		end

#		release c
	end

	if OD > OD_max
		step
			description: "The OD is too high, cell growth has saturated!"
			note: "Results may be negatively affected"
		end
	
	end
	
	step
	  description: "Clean the Nanodrop"
	  check: "Open the pedestal"
	  check: "Wipe both lower (sensor) pedestal and the upper (lid) pedestal with Kimwipe."
	end
end
release y
log
	return: {ODs: ODs}
end
