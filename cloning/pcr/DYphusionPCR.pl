argument
  tubenumber: number, "The tube number for this set of reactions"
  tanneal: number, "The anneal temperature in degrees C"
  enzyme_id: sample, "The Phsion HF Master Mix stock"
  num: number, "The number of PCR reactions, 1-12"
  primer1x1: sample, "The first primer: reaction 1"
  primer1x2: sample, "The second primer: reaction 1"
  plasmid1: sample, "The plasmid stock: reaction 1"
  primer2x1: sample, "The first primer: reaction 2"
  primer2x2: sample, "The second primer: reaction 2"
  plasmid2: sample, "The plasmid stock: reaction 2"
  primer3x1: sample, "The first primer: reaction 3"
  primer3x2: sample, "The second primer: reaction 3"
  plasmid3: sample, "The plasmid stock: reaction 3"
  primer4x1: sample, "The first primer: reaction 4"
  primer4x2: sample, "The second primer: reaction 4"
  plasmid4: sample, "The plasmid stock: reaction 4"
  primer5x1: sample, "The first primer: reaction 5"
  primer5x2: sample, "The second primer: reaction 5"
  plasmid5: sample, "The plasmid stock: reaction 5"
  primer6x1: sample, "The first primer: reaction 6"
  primer6x2: sample, "The second primer: reaction 6"
  plasmid6: sample, "The plasmid stock: reaction 6"
  primer7x1: sample, "The first primer: reaction 7"
  primer7x2: sample, "The second primer: reaction 7"
  plasmid7: sample, "The plasmid stock: reaction 7"
  primer8x1: sample, "The first primer: reaction 8"
  primer8x2: sample, "The second primer: reaction 8"
  plasmid8: sample, "The plasmid stock: reaction 8"
  primer9x1: sample, "The first primer: reaction 9"
  primer9x2: sample, "The second primer: reaction 9"
  plasmid9: sample, "The plasmid stock: reaction 9"
  primer10x1: sample, "The first primer: reaction 10"
  primer10x2: sample, "The second primer: reaction 10"
  plasmid10: sample, "The plasmid stock: reaction 10"
  primer11x1: sample, "The first primer: reaction 11"
  primer11x2: sample, "The second primer: reaction 11"
  plasmid11: sample, "The plasmid stock: reaction 11"
  primer12x1: sample, "The first primer: reaction 12"
  primer12x2: sample, "The second primer: reaction 12"
  plasmid12: sample, "The plasmid stock: reaction 12"
end

take
  phusion_stock = item enzyme_id
  primer1x1_stock = item primer1x1
  primer1x2_stock = item primer1x2
  primer2x1_stock = item primer2x1
  primer2x2_stock = item primer2x2
  primer3x1_stock = item primer3x1
  primer3x2_stock = item primer3x2
  primer4x1_stock = item primer4x1
  primer4x2_stock = item primer4x2
  primer5x1_stock = item primer5x1
  primer5x2_stock = item primer5x2
  primer6x1_stock = item primer6x1
  primer6x2_stock = item primer6x2
  primer7x1_stock = item primer7x1
  primer7x2_stock = item primer7x2
  primer8x1_stock = item primer8x1
  primer8x2_stock = item primer8x2
  primer9x1_stock = item primer9x1
  primer9x2_stock = item primer9x2
  primer10x1_stock = item primer10x1
  primer10x2_stock = item primer10x2
  primer11x1_stock = item primer11x1
  primer11x2_stock = item primer11x2
  primer12x1_stock = item primer12x1
  primer12x2_stock = item primer12x2
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
  check: "Pipet 1 µL of plasmid with id %{plasmid1} into well 1."
  check: "Pipet 1 µL of plasmid with id %{plasmid2} into well 2."
  check: "Pipet 1 µL of plasmid with id %{plasmid3} into well 3."
  check: "Pipet 1 µL of plasmid with id %{plasmid4} into well 4."
  check: "Pipet 1 µL of plasmid with id %{plasmid5} into well 5."
  check: "Pipet 1 µL of plasmid with id %{plasmid6} into well 6."
  check: "Pipet 1 µL of plasmid with id %{plasmid7} into well 7."
  check: "Pipet 1 µL of plasmid with id %{plasmid8} into well 8."
  check: "Pipet 1 µL of plasmid with id %{plasmid9} into well 9."
  check: "Pipet 1 µL of plasmid with id %{plasmid10} into well 10."
  check: "Pipet 1 µL of plasmid with id %{plasmid11} into well 11."
  check: "Pipet 1 µL of plasmid with id %{plasmid12} into well 12."
end

step 
  description: "Next, add the primers. IGNORE STEPS THAT TELL YOU TO ADD WATER"
  check: "Pipet 2.5 µL of primer with id %{primer1x1} into well 1."
  check: "Pipet 2.5 µL of primer with id %{primer1x2} into well 1."
  check: "Pipet 2.5 µL of primer with id %{primer2x1} into well 2."
  check: "Pipet 2.5 µL of primer with id %{primer2x2} into well 2."
  check: "Pipet 2.5 µL of primer with id %{primer3x1} into well 3."
  check: "Pipet 2.5 µL of primer with id %{primer3x2} into well 3."
  check: "Pipet 2.5 µL of primer with id %{primer4x1} into well 4."
  check: "Pipet 2.5 µL of primer with id %{primer4x2} into well 4."
  check: "Pipet 2.5 µL of primer with id %{primer5x1} into well 5."
  check: "Pipet 2.5 µL of primer with id %{primer5x2} into well 5."
  check: "Pipet 2.5 µL of primer with id %{primer6x1} into well 6."
  check: "Pipet 2.5 µL of primer with id %{primer6x2} into well 6."
  check: "Pipet 2.5 µL of primer with id %{primer7x1} into well 7."
  check: "Pipet 2.5 µL of primer with id %{primer7x2} into well 7."
  check: "Pipet 2.5 µL of primer with id %{primer8x1} into well 8."
  check: "Pipet 2.5 µL of primer with id %{primer8x2} into well 8."
  check: "Pipet 2.5 µL of primer with id %{primer9x1} into well 9."
  check: "Pipet 2.5 µL of primer with id %{primer9x2} into well 9."
  check: "Pipet 2.5 µL of primer with id %{primer10x1} into well 10."
  check: "Pipet 2.5 µL of primer with id %{primer10x2} into well 10."
  check: "Pipet 2.5 µL of primer with id %{primer11x1} into well 11."
  check: "Pipet 2.5 µL of primer with id %{primer11x2} into well 11."
  check: "Pipet 2.5 µL of primer with id %{primer12x1} into well 12."
  check: "Pipet 2.5 µL of primer with id %{primer12x2} into well 12."
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


release [primer1x1_stock[0],primer1x2_stock[0],primer2x1_stock[0],primer2x2_stock[0],primer3x1_stock[0],primer3x2_stock[0]]
release [primer4x1_stock[0],primer4x2_stock[0],primer5x1_stock[0],primer5x2_stock[0],primer6x1_stock[0],primer6x2_stock[0]]
release [primer7x1_stock[0],primer7x2_stock[0],primer8x1_stock[0],primer8x2_stock[0],primer9x1_stock[0],primer9x2_stock[0]]
release [primer10x1_stock[0],primer10x2_stock[0],primer11x1_stock[0],primer11x2_stock[0],primer12x1_stock[0],primer12x2_stock[0]]
release [plasmid1_stock[0],plasmid2_stock[0],plasmid3_stock[0],plasmid4_stock[0],plasmid5_stock[0],plasmid6_stock[0]]
release [plasmid7_stock[0],plasmid8_stock[0],plasmid9_stock[0],plasmid10_stock[0],plasmid11_stock[0],plasmid12_stock[0]]

release [phusion_stock[0]]

