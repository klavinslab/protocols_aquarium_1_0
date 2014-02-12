argument
  rna_id: sample, "The lysed RNA"
end

take
  rxn_mix = sample #, "Select te 5x iScript reaction mix"
  rev_enzyme = sample #, "Select the iScript reverse transcriptase"
  rna_yeast = rna_id #, "This is the isolated RNA"
end

step
  description: "This protocol prepares cDNA to be used in qPCR"
end

step
  description: "Label a 0.2 mL PCR tube. Write your initials on it."
  note: "Prior to moving forward check that your iScript reaction mix has \n generated any precipitation upon thawing." 
  bullet: "If precipitation has occured, please mix througly to resuspend, \n before moving forward"
end

step 
  description: "Prepare Reaction"
  check:"Pipet 4 µL of 5x iScript reaction mix into the labeled PCR tube."
  check: "Pipet 1 µL of iScript reverse transcriptase into the labeled PCR tube"
  check: "Pipet (some amount) of Nuclease-free water into the labeled PCR tube"
  check: "Pipet (some amount) of RNA template into the labeled PCR tube"
  check: "Use the tip to gently mix."
  note: "Be careful to pipette into the liquid, not the side of the tube."
end


step
  description: "You will now be asked to use the lab thermal cycler"
  note: "The thermal cycler will be shared by all groups (if others need it)."
  image: "thermal_cycler_off"
end

step
  description: "Place the tube into thermal cycler T2 at B3.335"
end

step
  description: "Choose program on the thermal cycler"
  note: "Click Home then click Saved Protocol, choose LABW14 folder, choose RT_React. "
  note: "Thermal cycling routine should be programmed prior to use. If not, contact lab supervisor."
  image: "thermal_cycler_home"
end

step
  description: "When all samples are loaded, hit 'run' on the thermal cycler and select 20 µL setting."
  note: "Hit run. The incubation time in the thermal cycler will take approximately 40 minutes"
  warning: "Hit next, immediately following the placement into the thermal cycler."
  timer: { hours: 0, minutes: 40, seconds: 0}
  image: "thermal_cycler_select"
end

step
  description: "*Optional Hold Stage*"
  note: "This is an optimal point to hold your sample if you do not anticipate time to finish."
  note: "If this is the case, do not remove the tube from the 4°C hold."
end

produce
  r = 1 "Yeast cDNA" of "target_strain"
  note: "Keep the tube on the bench to use in the next protool"
end

log
  return: {Yeast_cDNA_id: r[:id]}
end

release [rxn_mix[0],rev_enzyme[0],rna_yeast[0]]
