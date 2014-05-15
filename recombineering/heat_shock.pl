argument
  cells_flask_array: sample array , "Array of cell flaks to be heat shocked"
end

num_samples = length(cells_flask_array)

information "Heat shock temperature-sensitive cells. You will perform this protocol on %{num_samples} samples"

take
	taken_cells = item cells_flask_array
end

step
  description: "Prepare a heat bath"
  check: "Locate and plug in the hot water bath."
  check: "Press the button on the left labled 'I/O' to turn on the controller."
  check: "Set the middle temperature to 42 C"
  note: "Press the refresh button until a flashing tempurature appears and the leftmost thermometer is illumminated."
  note: "Use the up and down arrows to set the tempurature of the heat bath to 42 C."
  image: "heat_bath"
end

step
  description: "Label (%{num_samples}) 50 mL Falcon tube(s)"
  note: "Try and leave some extra room above the label.  This tube will get an item number later"
  foreach samp in cells_flask_array
    check: "Write 'from %{samp}' on the tube cap"
  end
end

step
  description: "Transfer each sample of log phase cells into a 50 mL Falcon Tube"
  note: "Pour the entire volume of the shaker tube into the 50 mL falcon tube. The volume should be approximately 25 mL."
end

step
  description: "Wait until the heat bath has reached 42C"
  note: "The next steps are time sensitive so you must make sure the bath is ready."
  image: "heat_bath"
end

step
  description: "Place cells in heat bath"
  note: "Don't press next until you are ready to walk the cells over to the bath."
  image: "tube_in_bath"
end

step
  description: "Wait 15 minutes."
  note: "While you wait, prep an ice bath"
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
  orig_id = find(:item,{id:id})[:data][:from]
	produce
  	hot_cells = 1 "Heat shocked tube" from taken_cells[ii]

		note: "This new sample is produced from Sample %{id}. Keep these cells on ice for the next step"
    warning: "Make sure you're labeling the tube that you previously labeled 'from %{id}'"
		data
			from: id	# for sample tracking purposes
			original_id: orig_id
		end
  	location: "Bench"
		release taken_cells[ii]
	end
	heat_treated_cells = append(heat_treated_cells, hot_cells[:id])
	ii = ii + 1
end


# output the id numbers of the treated cells for the next protocol
log
  return: {shocked_cells : heat_treated_cells}
end

