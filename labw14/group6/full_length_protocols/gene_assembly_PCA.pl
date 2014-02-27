argument
  oligo_pools1: sample array, "Select the first oligonucleotide stocks you want to combine through gene assembly"
  oligo_pools2: sample array, "Select the second oligonucleotide stocks you want to combine through gene assembly"
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
  description:
    "This protocol describes how to run gene assembly of two oligonuleotide stocks."
end

step
  description: "Label a 0.2 mL PCR tube. Write your initials on it."
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
end

step
  description: "Put the prepared PCR tube on the bench."
end

release primer1_stock
release primer2_stock
release masterstock1
release masterstock2
release phusion_stock

step
  description: "You will now be asked to use the lab thermal cycler"
  note: "The thermal cycler will be shared by all groups."
  warning: "Make sure it is not in use. Never open the lid of the running thermal cycler."
  image: "thermal_cycler_off"
end

step
  description: "Place both tubes into thermal cycler T2 at B3.335."
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
  description: "The heat treatment takes about 2 hours"
  note: "Meanwhile, you may pour the gel inside the gel room to have your gel ready before the next step."
end

step
  description: "Go to the thermal cycler and pick up the product of the PCA."
  note: "And place the tube at your bench"
  warning: "You can keep them in -4C fridge (SF) in case you are not using them right away."
end

produce
  r = 1 "PCR Result" of "fGA"

end

log
  return: { PCR_Result_id: r[:id] }
end


