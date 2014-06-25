argument
  params: generic, "not for human use"
  #cells_flask_array: sample array , "Array of cell flaks to be heat shocked"
end
cells_flask_array = params[:log_cells]

num_samples = length(cells_flask_array)

information "Heat shock temperature-sensitive cells. You will perform this protocol on %{num_samples} samples"

take
	taken_cells = item cells_flask_array
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
  note: "Pour the entire volume of the shaker flask into the 50 mL falcon tube. The volume should be approximately 25 mL."
end

step
  description: "Place all tubes in heat bath"
  note: "Place each 50 mL falcon tube you just poured into the the 42 C bath."
  bullet: "Press next when you're ready to move the tubes into the bath."
  image: "tube_in_bath"
end

step
  description: "Incubate in bath for 15 minutes."
  note: "While you wait, prep an ice bath"
  check: "Find a styrofoam box."
  check: "Put a 50 mL tube rack inside with some ice or ice packs."
  check: "Fill with water half way up the tube rack"
  image: "rack_in_ice_water"
  timer: { hours: 0, minutes: 15, seconds: 0 }
  warning: "This is a time sensitive step!  Do not leave the cells in the bath longer than 15 minutes."
end

step
  description: "Chill the cells"
  note: "Remove the tubes from the heat bath and place in the ice bath you just made.  Make sure the cells have fully chilled for 5-10 minutes before continuing."
  check: "While you wait, locate chilled molecular grade water (in a 50mL falcon tube) and place it into the ice bath as well."
  timer: { hours: 0, minutes: 8, seconds: 0 }
end

#
# Produce each new heat treated sample
ii = 0
heat_treated_cells = []

while ii < num_samples
	id = taken_cells[ii][:id]
  #orig_id = find(:item,{id:id})[:data][:from]
  orig_id = taken_cells[ii][:data][:from]
	produce
  	hot_cells = 1 "Heat shocked tube" from taken_cells[ii]

		note: "This new sample is produced from Sample %{id}. Keep these cells on ice for the next step. Make sure you're labeling the tube that you previously labeled 'from %{id}'"
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

params[:shocked_cells] = heat_treated_cells

# output the id numbers of the treated cells for the next protocol
log
  return: {params: params}
end

