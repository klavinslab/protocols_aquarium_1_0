# Author: Patrick Ma
# 2/17/2014
#
# A modified version of the heat_shock protocol for making multiple samples of
# electrocompetent cells simultaneously

# Precondition: The input array has no duplicates 
argument
  cells_flask_array: sample array , "Array of cells to be heat shocked"
end

num_samples = length(cells_flask_array)

information "Heat shock temperature sensitive cells. You will perform this protocol on %{num_samples} samples"

take
	taken_cells = item cells_flask_array
end

step
  description: "Label (%{num_samples}) 50 mL Falcon tube(s)"
  note: "Write your initials, date, and sample number on the cap of each tube."
end

step
  description: "Transfer each sample of log phase cells into a 50 mL Falcon Tube"
  note: "Pour the entire volume of the shaker flask into the 50 mL tube. The volume should be approximately 18 mL."
end

# NOTE: must break up the cells into batches that will fit inside the heat bath

bath_size = 4	# the number of falcon tubes that will fit in the bath
step
  description: "Locate the 42 C heat bath at B13.105"
  note: "The next steps are time sensitive so you must know beforehand where the bath is."
  image: "heat_bath"
end

step
  description: "Place cells in heat bath"
  note: "Don't press next until you are ready to walk the cells over to the bath."
  image: "tube_in_bath"
end

step
  description: "Wait 15 minutes."
  note: "While you wait you can prep an ice bath"
  check: "Find a styrofoam box."
  check: "Put a 50 mL tube rack inside with some ice or ice packs."
  check: "Fill with water half way up the tube rack"
  image: "rack_in_ice_water"
  timer: { hours: 0, minutes: 15, seconds: 0 }
  warning: "This is a time sensitive step!  Do not leave the cells in the bath longer than 15 minutes."
end

step
  description: "Go grab the cells and prepare to put in the ice bath"
end

step
  description: "Chill the cells"
  note: "Submerge the cells in the ice bath you just made.  Make sure the cells have fully chilled for 5-10 minutes before continuing."
  timer: { hours: 0, minutes: 8, seconds: 0 }
end

#
# Produce each new heat treated sample
ii = 0
heat_treated_cells = []

while ii < num_samples
	id = taken_cells[ii][:id]

	produce
  	hot_cells = 1 "Heat shocked tube" from taken_cells[ii]

		note: "This new sample is produced from Sample %{id}. Keep these cells on ice for the next step"
		data
			from: id	# for sample tracking purposes
		end
  	location: "Bench"
		release taken_cells[ii]
	end
	heat_treated_cells = append(heat_treated_cells, hot_cells[:id])
	ii = ii + 1
end


# output the id numbers of the treated cells for the next protocol
log
  shocked_cells : heat_treated_cells 
end

