argument
  oligo_pools1: sample, "Select the first oligonucleotide stocks you want to combine through gene assembly"
  #oligo_pools2: sample array, "Select the second oligonucleotide stocks you want to combine through gene assembly"
  primer1: sample, "The first primer"
  primer2: sample, "The second primer"
  enzyme_id: sample, "The Phsion HF Master Mix stock"
end


take
  masterstock1 = item oligo_pools1
  #masterstock2 = item oligo_pools2
  primer1_stock = item primer1
  primer2_stock = item primer2
  phusion_stock = item enzyme_id
end
  

step
  description: "This protocol describes how to run gene assembly of two oligonuleotide stocks."
end

step
  description: "Label a 0.2 mL PCR tube. Write your initials on it."
  image: "Group6_pcr_label"
end

o1 = oligo_pools1
#o2 = oligo_pools2

step
  description: "Prepare Reaction"
  check:"Pipette 17.5 µL molecular grade water into the labeled PCR tube."
  check: "Pipette 2.5 µL of primer pool with id %{o1} into the tube."
  check: "Pipette 2.5 µL of primer with id %{primer1} into the tube."
  check: "Pipette 2.5 µL of primer with id %{primer2} into the tube."
  check: "Pipette 25 µL of Phusion Master Mix with id %{enzyme_id} into the tube."
  check: "Use the tip to gently mix."
  warning: "Be careful to pipette into the liquid, not the side of the tube."
  image: "Group6_pcr_reaction"
end

 step
    description: "Keep the prepared PCR tube on the bench while proceeding to the second assembly protocol."
    image: "Group6_pcr_bench"
 end
 

release [primer1_stock[0],primer2_stock[0],phusion_stock[0]]
#release primer2_stock
release masterstock1
#release masterstock2
#release phusion_stock

produce
    r = 1 "PCR Result" of "fGA"
end

log
    return: { PCR_Result_id: r[:id] }
end




