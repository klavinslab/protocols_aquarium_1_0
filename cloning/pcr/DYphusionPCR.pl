argument
  tubenumber: number, "The tube number for this set of reactions"
  tanneal: number, "The anneal temperature in degrees C"
  enzyme_id: sample, "The Phsion HF Master Mix stock"
  num: number, "The number of PCR reactions, 1-12"
  p1rimer1: sample, "The first primer: reaction 1"
  p1rimer2: sample, "The second primer: reaction 1"
  p1lasmid: sample, "The plasmid stock: reaction 1"
  p2rimer1: sample, "The first primer: reaction 2"
  p2rimer2: sample, "The second primer: reaction 2"
  p2lasmid: sample, "The plasmid stock: reaction 2"
  p3rimer1: sample, "The first primer: reaction 3"
  p3rimer2: sample, "The second primer: reaction 3"
  p3lasmid: sample, "The plasmid stock: reaction 3"
  p4rimer1: sample, "The first primer: reaction 4"
  p4rimer2: sample, "The second primer: reaction 4"
  p4lasmid: sample, "The plasmid stock: reaction 4"
  p5rimer1: sample, "The first primer: reaction 5"
  p5rimer2: sample, "The second primer: reaction 5"
  p5lasmid: sample, "The plasmid stock: reaction 5"
  p6rimer1: sample, "The first primer: reaction 6"
  p6rimer2: sample, "The second primer: reaction 6"
  p6lasmid: sample, "The plasmid stock: reaction 6"
  p7rimer1: sample, "The first primer: reaction 7"
  p7rimer2: sample, "The second primer: reaction 7"
  p7lasmid: sample, "The plasmid stock: reaction 7"
  p8rimer1: sample, "The first primer: reaction 8"
  p8rimer2: sample, "The second primer: reaction 8"
  p8lasmid: sample, "The plasmid stock: reaction 8"
  p9rimer1: sample, "The first primer: reaction 9"
  p9rimer2: sample, "The second primer: reaction 9"
  p9lasmid: sample, "The plasmid stock: reaction 9"
  p10rimer1: sample, "The first primer: reaction 10"
  p10rimer2: sample, "The second primer: reaction 10"
  p10lasmid: sample, "The plasmid stock: reaction 10"
  p11rimer1: sample, "The first primer: reaction 11"
  p11rimer2: sample, "The second primer: reaction 11"
  p11lasmid: sample, "The plasmid stock: reaction 11"
  p12rimer1: sample, "The first primer: reaction 12"
  p12rimer2: sample, "The second primer: reaction 12"
  p12lasmid: sample, "The plasmid stock: reaction 12"
end

take
  phusion_stock = item enzyme_id
  1primer1_stock = item 1primer1
  1primer2_stock = item 1primer2
  2primer1_stock = item 2primer1
  2primer2_stock = item 2primer2
  3primer1_stock = item 3primer1
  3primer2_stock = item 3primer2
  4primer1_stock = item 4primer1
  4primer2_stock = item 4primer2
  5primer1_stock = item 5primer1
  5primer2_stock = item 5primer2
  6primer1_stock = item 6primer1
  6primer2_stock = item 6primer2
  7primer1_stock = item 7primer1
  7primer2_stock = item 7primer2
  8primer1_stock = item 8primer1
  8primer2_stock = item 8primer2
  9primer1_stock = item 9primer1
  9primer2_stock = item 9primer2
  10primer1_stock = item 10primer1
  10primer2_stock = item 10primer2
  11primer1_stock = item 11primer1
  11primer2_stock = item 11primer2
  12primer1_stock = item 12primer1
  12primer2_stock = item 12primer2
end

take
  1plasmid_stock = item 1plasmid
  2plasmid_stock = item 2plasmid
  3plasmid_stock = item 3plasmid
  4plasmid_stock = item 4plasmid
  5plasmid_stock = item 5plasmid
  6plasmid_stock = item 6plasmid
  7plasmid_stock = item 7plasmid
  8plasmid_stock = item 8plasmid
  9plasmid_stock = item 9plasmid
  10plasmid_stock = item 10plasmid
  11plasmid_stock = item 11plasmid
  12plasmid_stock = item 12plasmid
end

step
  description: "This protocol prepares up to 12 PCR reactions in a strip-well tube."
end

step
  description: "Grab a 12 strip-well PCR tube and cap, and rest it in a green PCR tube rack. With the numbers FACING YOU, do the following:"
  check: "Label the left most well with your initials"
  check: "Label the well that is second from the left with the number %{tubenumber}"
  check: "Label the right most well with the number %{tanneal}"
end

step 
  description: "Begin by adding water"
  note:"Pipet 19 µL molecular grade water into wells 1 through %{num}."
  warning: "Be careful to pipette into the liquid, not the side of the tube."
end

step 
  description: "Next, add plasmid. IGNORE STEPS THAT TELL YOU TO ADD WATER"
  check: "Pipet 1 µL of plasmid with id %{1plasmid} into well 1."
  check: "Pipet 1 µL of plasmid with id %{2plasmid} into well 2."
  check: "Pipet 1 µL of plasmid with id %{3plasmid} into well 3."
  check: "Pipet 1 µL of plasmid with id %{4plasmid} into well 4."
  check: "Pipet 1 µL of plasmid with id %{5plasmid} into well 5."
  check: "Pipet 1 µL of plasmid with id %{6plasmid} into well 6."
  check: "Pipet 1 µL of plasmid with id %{7plasmid} into well 7."
  check: "Pipet 1 µL of plasmid with id %{8plasmid} into well 8."
  check: "Pipet 1 µL of plasmid with id %{9plasmid} into well 9."
  check: "Pipet 1 µL of plasmid with id %{10plasmid} into well 10."
  check: "Pipet 1 µL of plasmid with id %{11plasmid} into well 11."
  check: "Pipet 1 µL of plasmid with id %{12plasmid} into well 12."
end

step 
  description: "Next, add the primers. IGNORE STEPS THAT TELL YOU TO ADD WATER"
  check: "Pipet 2.5 µL of primer with id %{1primer1} into well 1."
  check: "Pipet 2.5 µL of primer with id %{1primer2} into well 1."
  check: "Pipet 2.5 µL of primer with id %{2primer1} into well 2."
  check: "Pipet 2.5 µL of primer with id %{2primer2} into well 2."
  check: "Pipet 2.5 µL of primer with id %{3primer1} into well 3."
  check: "Pipet 2.5 µL of primer with id %{3primer2} into well 3."
  check: "Pipet 2.5 µL of primer with id %{4primer1} into well 4."
  check: "Pipet 2.5 µL of primer with id %{4primer2} into well 4."
  check: "Pipet 2.5 µL of primer with id %{5primer1} into well 5."
  check: "Pipet 2.5 µL of primer with id %{5primer2} into well 5."
  check: "Pipet 2.5 µL of primer with id %{6primer1} into well 6."
  check: "Pipet 2.5 µL of primer with id %{6primer2} into well 6."
  check: "Pipet 2.5 µL of primer with id %{7primer1} into well 7."
  check: "Pipet 2.5 µL of primer with id %{7primer2} into well 7."
  check: "Pipet 2.5 µL of primer with id %{8primer1} into well 8."
  check: "Pipet 2.5 µL of primer with id %{8primer2} into well 8."
  check: "Pipet 2.5 µL of primer with id %{9primer1} into well 9."
  check: "Pipet 2.5 µL of primer with id %{9primer2} into well 9."
  check: "Pipet 2.5 µL of primer with id %{10primer1} into well 10."
  check: "Pipet 2.5 µL of primer with id %{10primer2} into well 10."
  check: "Pipet 2.5 µL of primer with id %{11primer1} into well 11."
  check: "Pipet 2.5 µL of primer with id %{11primer2} into well 11."
  check: "Pipet 2.5 µL of primer with id %{12primer1} into well 12."
  check: "Pipet 2.5 µL of primer with id %{12primer2} into well 12."
end

step 
  description: "Finally, add Phusion Master Mix. USE A NEW PIPETTE TIP FOR EACH WELL AND PIPETTE UP AND DOWN TO MIX"
  note:"Pipet 25 µL Phusion Master Mix with id %{enzyme_id} into wells 1 through %{num}."
end

step
  description: "Begin the PCR reaction with a thermal cycler"
  check: "Put the cap on the PCR strip tubes and press each one very hard to make sure they are sealed."
  check: "Place the tube into an available thermal cycler and close the lid"
  check: "Click Home then click Saved Protocol, choose DAVID, choose CLONEPCR."
  check: "Set the anneal temperature to %{tanneal}"
  check: "hit 'run' and select 50ul"
  image: "thermal_cycler_home"
end


release [1primer1_stock[0],1primer2_stock[0],2primer1_stock[0],2primer2_stock[0],3primer1_stock[0],3primer2_stock[0]]
release [4primer1_stock[0],4primer2_stock[0],5primer1_stock[0],5primer2_stock[0],6primer1_stock[0],6primer2_stock[0]]
release [7primer1_stock[0],7primer2_stock[0],8primer1_stock[0],8primer2_stock[0],9primer1_stock[0],9primer2_stock[0]]
release [10primer1_stock[0],10primer2_stock[0],11primer1_stock[0],11primer2_stock[0],12primer1_stock[0],12primer2_stock[0]]
release [1plasmid_stock[0],2plasmid_stock[0],3plasmid_stock[0],4plasmid_stock[0],5plasmid_stock[0],6plasmid_stock[0]]
release [7plasmid_stock[0],8plasmid_stock[0],9plasmid_stock[0],10plasmid_stock[0],11plasmid_stock[0],12plasmid_stock[0]]

release [phusion_stock[0]]

