information "Heat shock temperature sensitive cells."

argument
  cells_flask: sample , "cells to be heat shocked"
end

take
  cells = item cells_flask
#  tube = 1 "50 mL Falcon Tube"
end
cells = cells[0]
tube = tube[0]

step
  description: "Label a 50 mL Falcon tube"
  note: "Write you initials and date on the cap of the tube."
end

step
  description: "Transfer the cells to the labeled 50 mL Falcon Tube by pouring"
  note: "Pour the log phase cells from the shaker flask into the 50 mL tube. The volume should be approximately 18 mL."
end

step
  description: "Locate the 42 C heat bath at A1.535"
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

produce
  hot_cells = 1 "Heat shocked tube" from cells
  note: "Make sure to keep the cells in the ice bath for the next step."
  location: "Bench"
  release [cells, tube]
end

log
  return: { cell_id: hot_cells[:id]}
end
