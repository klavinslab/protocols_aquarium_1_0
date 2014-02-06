argument
  plate_array: sample("E coli strain") array, "Choose the plates you incubated yesterday"
end

n = length(plate_array)

take
  colony_plate_array = item plate_array
  aliquot = 1 "50 mL LB liquid aliquot (sterile)"
  test_tube = n "14 mL Test Tube"
end

step
  description: 
    "This protocol describes how to create an overnight colony suspension using the colonies of a previously incubated   plate"
end

step
  description: "Label %{n} 14 mL tubes with your initials and date.  Number them 1 to %{n}"
  note: "place the tubes in a test tube rack.\n
  These tubes will eventually hold the transformed cells"
end

step
  description: "Pipette 2 mL of LB into each 14 mL tube"
  note: "Use proper sterile technique. Use the 1000 μL pipetter."
  bullet: "Set pipetter to 1000μL"
  bullet: "Loosen cap on LB aliquot"
  bullet: "Pipette 2 mL of LB into each of %{n} 14 mL tubes"
  bullet: "Recap test tube and LB"
end

step
  description: "Next, you will add a colony to each tube"
end

i=0
while i<n
step
  description: "Add a colony to each of %{n} suspensions"
  note: "Match each plate to its corresponding tube.  For each pair:"
  check: "add a colony from plate %{plate_array[i]} to tube %{i}"
  note: "Select the desired colony prior to opening plate. Mark desired colony with circle and intials and date"
  note: "Selection of your colony should be based on size (medium-big, not too big), isolated, and round in shape." 
  bullet: "Take a sterile pipette tip, pick up the desired colony by gently scraping the tip to the colony."
  bullet: "Tilt 14 mL tube such that you can reach the broth with your tip."
  bullet: "Scrape colony into broth, using a swirling motion"
  warning: "!DON'T SPILL THE BROTH!"
end
i= i+1
end

i=0;
while i<n
  produce
    s = 1 "Overnight suspension culture from tube %{i}" from colony_plate_array[i]
    note: "Place all in 37 degree incubator at B13.425 for 18-24 hours"
    location: "B13.425"
  end
i= i+1
end

step
  description: "Return all equipment to specified areas"
  note: "Remember to wrap plates with parafilm"
  check: "Return test tube rack to Bench"
end

release concat(colony_plate_array, aliquot)

log
  return: { transformed_cells_id: s[:id]}
end
#log
#  return: { transformed_cells_id: r[:id], tube_incubation_choice : tube_incubation_choice }
#end
