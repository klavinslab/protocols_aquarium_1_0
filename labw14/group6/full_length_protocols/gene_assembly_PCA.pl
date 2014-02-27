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
  note: "Be careful to pipette into the liquid, not the side of the tube."
end

step
  description: "Put the prepared PCR tube on the bench."
end

release primer1_stock
release primer2_stock
release masterstock1
release masterstock2
release phusion_stock
