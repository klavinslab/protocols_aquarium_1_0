argument
  id: sample ("Transformed E coli Strain"), "This is where our cells will come from"
end

step
  description: "Prepare the agar film to use on the microscope"
  note: "In this protocol we will create an agar cell dish which we will use to find cells using the microscope."
  note: "Click next to begin this procedure"
end

take
  test_tube = 1 "5 mL Culture Tube"
  dish = 1 "Sterile Glass Bottom Dish"
  plate = 1 "M9 Glucose Agar"
  ons = item id
end

step
  description: "Prepare the petri dish for the agar film"
  bullet: "Using a 10 microL pipetter, pipette 1 microL of our M9 diluted cells into the center of the glass bottom dish"
  bullet: "There should be a grove in the dish where the liquid should go"
  bullet: "Replace the cap on the dish to reduce contamination of the sample"
  note: "it should just look like a small bead of liquid at the center of the petri dish."
  image: "dish_with_m9"
end

step
  description: "Sterilize the culture tube"
  note: "Using the 140 proof ethanol alcohol spray bottle, and a kimwipe, wipe the culture tube."
end

step
  description: "Cut the agar film"
  bullet: "Take the cap off of the 5 mL culture tube"
  bullet: "Take the lid off of the M9 agar petri dish"
  bullet: "Punch a hole in the agar plate using the opening of the 5 mL culture tube"
  image: "agar_punch"
end

step
  description: "Sterilize the spatula"
  note: "Again using the ethanol alcohol and a fresh kimwipe sterilize the spatula found on the bench."
  image: "spatula"
end

step
  description: "Place the agar film in the petri dish"
  warning: "The film is delicate, HIGH precision is necessary."
  bullet: "Using a spatula carefully remove the punched out agar film from the dish."
  bullet: "CAREFULLY place the agar film on top of our cells in the center of the dish"
  bullet: "Use the spatula to GENTLY flatten out any air bubbles"
  note: "The agar will most likely stick to the spatula. You may use a FRESH 1 mL pipette tip to assist in placing the agar."
  image: "combined_image"
end

step
  description: "Recap the petri dish"
  note: "Replace the cap on the petri dish with our agar film, and prepare to use the microscope."
end

produce
  r = 1 "Microscope Plate" from ons[0]
  location: "Bench"
  note: "You will be taking this with you to the microscope lab."
  note: "Be sure to label the side of the dish with your initials and item ID number."
end

log
  return: {dish: r[:id]}
end

release [test_tube[0], plate[0], ons[0]]
