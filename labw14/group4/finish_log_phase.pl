##
## Adapted from existing protocol
##
 
argument
  log_cells: sample array, "The sample that you want to spec its concentration"
end

OD_min = .4
OD_max = .6

take
  y = item log_cells
  lb = 1 "50 mL LB liquid aliquot (sterile)"
end

information "Measure DNA concentration using Nanodrop spectrophotometer."

step
  description: "Take the cells and LB to the Nanodrop at location B3.405"
end

ODs = []
foreach c in log_cells
	step
	  description: "Blank the Nanodrop"
	  check: "Wipe both lower (sensor) pedestal and the upper (lid) pedestal with Kimwipe."
	  check: "Add 2 μL of LB Buffer." # Should we blank with LB or EB?
	  check: "Close the pedestal."
	  check: "Click Blank in the software."
	end

	## What settings should we set the nanodrop to?

	step
	  description: "Measure your sample"
	  check: "Open the pedestal"
	  check: "Wipe both lower (sensor) pedestal and the upper (lid) pedestal with Kimwipe."
	  check: "Add 2 μL of your sample with id %{c} on the lower pedestal."
	  check: "Close the pedestal."
	  check: "Click Measure in the software."
	end

	step
	  description: "Record the optical density measurement (OD) shown on the nanodrop computer"
	  getdata
		OD: number,"Write down the OD as shown on the computer" #Better disc. of where to find it?
	  end
	end
	ODs = append(ODs, OD)
	
	if OD < OD_min
		step
			description: "The OD is too low; the cells haven't grown enough!"
			note: "Reincubation is suggested"
		end
	end
	if OD < OD_max
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
