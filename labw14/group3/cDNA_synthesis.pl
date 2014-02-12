argument
  rxn_mix: sample, "Select te 5x iScript reaction mix"
  rev_enzyme: sample, "Select the iScript reverse transcriptase"
  rna_id: sample, "The lysed RNA"
end

take
  iscript_mix = item rxn_mix
  rev_trans = item rev_enzyme
  rna_yeast = rna_id
end

step
  description: "This protocol prepares cDNA to be used in qPCR"
end

step
  description: "Label a 0.2 mL PCR tube. Write your initials on it."
  note: "Prior to moving forward check that your iScript reaction mix has
    generated any precipitation upon thawing. 
  bullet: "If precipitation has occured, please mix througly to resuspend, 
    before moving forward"
end

step 
  description: "Prepare Reaction"
  check:"Pipet 4 µL of 5x iScript reaction mix into the labeled PCR tube."
  check: "Pipet 1 µL of iScript reverse transcriptase in to the labeled PCR tube"
  check: "Pipet 1 µL of primer with id %{primer1} into the tube."# ended here
  check: "Pipet 1 µL of primer with id %{primer2} into the tube."
  check: "Pipet 10 µL of Phusion Master Mix with id %{enzyme_id} into the tube."
  check: "Use the tip to gently mix."
  note: "Be careful to pipette into the liquid, not the side of the tube."
end

release phusion_stock

step
  description: "You will now be asked to use the lab thermal cycler"
  note: "The thermal cycler will be shared by all groups."
  image: "thermal_cycler_off"
end

step
  description: "Place the tube into thermal cycler T2 at B3.335"
end

step
  description: "Choose program on the thermal cycler"
  note: "Click Home then click Saved Protocol, choose LABW14 folder, choose COLONYPCR. Wait for all other groups to load in their samples."
  image: "thermal_cycler_home"
end

step
  description: "When all group samples are loaded, hit 'run' on the thermal cycler and select 20 µL setting."
  note: "Coordinate with your fellow classmates to put all their samples before hit run."
  image: "thermal_cycler_select"
end


release [primer1_stock[0],primer2_stock[0],plasmid_stock[0]]


