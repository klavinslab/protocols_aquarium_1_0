argument
  tubenumber: number, "The tube number for this set of reactions"
  tanneal: number, "The anneal temperature in degrees C"
  enzyme_id: sample, "The Phsion HF Master Mix stock"
  num: number, "The number of PCR reactions, 1-12"
  primer1_1: sample, "The first primer: reaction 1"
  primer1_2: sample, "The second primer: reaction 1"
  plasmid1: sample, "The plasmid stock: reaction 1"
  primer2_1: sample, "The first primer: reaction 2"
  primer2_2: sample, "The second primer: reaction 2"
  plasmid2: sample, "The plasmid stock: reaction 2"
  primer3_1: sample, "The first primer: reaction 3"
  primer3_2: sample, "The second primer: reaction 3"
  plasmid3: sample, "The plasmid stock: reaction 3"
  primer4_1: sample, "The first primer: reaction 4"
  primer4_2: sample, "The second primer: reaction 4"
  plasmid4: sample, "The plasmid stock: reaction 4"
  primer5_1: sample, "The first primer: reaction 5"
  primer5_2: sample, "The second primer: reaction 5"
  plasmid5: sample, "The plasmid stock: reaction 5"
  primer6_1: sample, "The first primer: reaction 6"
  primer6_2: sample, "The second primer: reaction 6"
  plasmid6: sample, "The plasmid stock: reaction 6"
  primer7_1: sample, "The first primer: reaction 7"
  primer7_2: sample, "The second primer: reaction 7"
  plasmid7: sample, "The plasmid stock: reaction 7"
  primer8_1: sample, "The first primer: reaction 8"
  primer8_2: sample, "The second primer: reaction 8"
  plasmid8: sample, "The plasmid stock: reaction 8"
  primer9_1: sample, "The first primer: reaction 9"
  primer9_2: sample, "The second primer: reaction 9"
  plasmid9: sample, "The plasmid stock: reaction 9"
  primer10_1: sample, "The first primer: reaction 10"
  primer10_2: sample, "The second primer: reaction 10"
  plasmid10: sample, "The plasmid stock: reaction 10"
  primer11_1: sample, "The first primer: reaction 11"
  primer11_2: sample, "The second primer: reaction 11"
  plasmid11: sample, "The plasmid stock: reaction 11"
  primer12_1: sample, "The first primer: reaction 12"
  primer12_2: sample, "The second primer: reaction 12"
  plasmid12: sample, "The plasmid stock: reaction 12"
end

take
  phusion_stock = item enzyme_id
  primer1_1_stock = item primer1_1
  primer1_2_stock = item primer1_2
  primer2_1_stock = item primer2_1
  primer2_2_stock = item primer2_2
  primer3_1_stock = item primer3_1
  primer3_2_stock = item primer3_2
  primer4_1_stock = item primer4_1
  primer4-2_stock = item primer4_2
  primer5_1_stock = item primer5_1
  primer5_2_stock = item primer5_2
  primer6_1_stock = item primer6_1
  primer6_2_stock = item primer6_2
  primer7_1_stock = item primer7_1
  primer7_2_stock = item primer7_2
  primer8_1_stock = item primer8_1
  primer8_2_stock = item primer8_2
  primer9_1_stock = item primer9_1
  primer9_2_stock = item primer9_2
  primer10_1_stock = item primer10_1
  primer10_2_stock = item primer10_2
  primer11_1_stock = item primer11_1
  primer11_2_stock = item primer11_2
  primer12_1_stock = item primer12_1
  primer12_2_stock = item primer12_2
end

take
  plasmid1_stock = item plasmid1
  plasmid2_stock = item plasmid2
  plasmid3_stock = item plasmid3
  plasmid4_stock = item plasmid4
  plasmid5_stock = item plasmid5
  plasmid6_stock = item plasmid6
  plasmid7_stock = item plasmid7
  plasmid8_stock = item plasmid8
  plasmid9_stock = item plasmid9
  plasmid10_stock = item plasmid10
  plasmid11_stock = item plasmid11
  plasmid12_stock = item plasmid12
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

