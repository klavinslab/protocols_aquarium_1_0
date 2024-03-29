argument
  oligo_pools1: sample array, "Select the first oligonucleotide stocks you want to combine through gene assembly"
  oligo_pools2: sample, "Select the second oligonucleotide stocks you want to combine through gene assembly"
  primer1: sample, "The first primer"
  primer2: sample, "The second primer"
  enzyme_id: sample, "The Phsion HF Master Mix stock"
end


take
  masterstock1 = item oligo_pools1
  masterstock2 = item oligo_pools2
  primer1_stock = item primer1
  primer2_stock = item primer2
  phusion_stock = item enzyme_id
end
  

step
  description: "This protocol again describes how to run gene assembly of two oligonuleotide stocks."
end

step
  description: "Label another 0.2 mL PCR tube. Write your initials on it."
  image: "Group6_pcr_label"
end

o1 = oligo_pools1
o2 = oligo_pools2

step
  description: "Prepare Reaction"
  check:"Pipette 10 µL molecular grade water into the labeled PCR tube."
  check: "Pipette 5 µL of primer pool with id %{o1} into the tube."
  check: "Pipette 5 µL of primer pool with id %{o2} into the tube."
  check: "Pipette 2.5 µL of primer with id %{primer1} into the tube."
  check: "Pipette 2.5 µL of primer with id %{primer2} into the tube."
  check: "Pipette 25 µL of Phusion Master Mix with id %{enzyme_id} into the tube."
  check: "Use the tip to gently mix."
  warning: "Be careful to pipette into the liquid, not the side of the tube."
  image: "Group6_pcr_reaction"
end

step
  description: "Put the prepared PCR tube on the bench."
  image: "Group6_pcr_bench"
end

produce
  r = 1 "PCR Result" of "fGA"
end

release [primer1_stock[0],primer2_stock[0],masterstock1[0],masterstock2[0],phusion_stock[0]] 
#release primer2_stock
#release masterstock1
#release masterstock2
#release phusion_stock

step
  description: "You will now be asked to use the lab thermal cycler."
  note: "The thermal cycler will be shared by all groups."
  warning: "Make sure it is not in use. Never open the lid of the running thermal cycler."
  image: "thermal_cycler_off"
end

step
  description: "Place both tubes (one from this protocol and onother from the previous assembly protocol) into the thermal cycler T2 at B3.335."
  image: "Group6_TC_pcr"
end

step
  description: "Choose program on the thermal cycler."
  note: "Click Home then click Saved Protocol, choose Nick folder, choose assemble."
  image: "thermal_cycler_home"
end

step
  description: "When both samples are loaded, hit 'run' on the thermal cycler and select 50 µL setting."
  image: "thermal_cycler_select"
end

step
  description: "The heat treatment takes about 1.5 hours"
  note: "Meanwhile, you may pour the gel inside the gel room to have it ready before the next step (run gel)."
  note: "In Aquarium, go to protocols, Github, LABW14, Group6, Full length protocols, pour_gel, put down 1 for percentage and use 1 comb."
  timer: { hours: 1, minutes: 30, seconds: 0 }
  note: "Click NEXT when the timer is done."
end

step
  description: "Go to the thermal cycler and pick up the products of the PCA."
  note: "And place the tubes at your bench"
  note: "The next step is running gel to verify the band length of assembled fragment."
  warning: "You can keep them in -4C deli fridge in the case you are not using them right away."
end



log
  return: { PCR_Result_id: r[:id] }
end


