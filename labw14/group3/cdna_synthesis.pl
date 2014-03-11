argument
  rxn_mix: sample, "Select the 5x iScript reaction mix"
  rev_enzyme: sample, "Select the iScript reverse transcriptase"
  rna_iso_array: sample array, "This is the isolated RNA from before"
  rna_conc_array: number array
end

take
  react_mix = item rxn_mix
  iscript_enz = item rev_enzyme
  rna_iso = item rna_iso_array
  nuc_water = 1 "Nuclease Free Water"
end

n=length(rna_iso_array)

step
  description: "This protocol prepares cDNA to be used in qPCR"
  note: "Using template RNA you will synthesize complementary DNA to be used later"
end

step
  description: "Label %{n} 0.2 mL PCR tubes. Write your initials and id's on them."
  note: "Prior to moving forward check that your iScript reaction mix has not generated any precipitation upon thawing." 
  bullet: "If precipitation has occured, please mix thoroughly to resuspend, before moving forward"
end

i = 0
while i<n
  thisConc = rna_conc_array[i]
  molec_wat= (thisConc/0.2)-1
  thisRNA = rna_iso_array[i]

  step
    description: "Dilute your isolated RNA"
    bullet: "In a separate 1.5 mL tube, add 1 µL of %{thisRNA}."
    bullet: "In the same 1.5 mL tube, add %{molec_wat} of Nuclease free water."
  end
  
  step 
    description: "Prepare Reaction"
    check:"Pipet 4 µL of 5x iScript reaction mix into the labeled PCR tube."
    check: "Pipet 1 µL of iScript reverse transcriptase into the labeled PCR tube"
    check: "Pipet 10 µL of Nuclease-free water into the labeled PCR tube"
    check: "Pipet 5 µL of RNA template %{thisRNA} into the labeled PCR tube"
    check: "Use the tip to gently mix."
    note: "Be careful to pipette into the liquid, not the side of the tube."
  end
  i = i+1
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
  image: "thermal_cycler_select"
end

release concat(react_mix,iscript_enz)

step
  description: "*Optional Hold Stage*"
  note: "This is an optimal point to hold your sample if you do not anticipate time to finish."
  note: "If this is the case, do not remove the tube from the 4°C hold."
  timer: { hours: 0, minutes: 40, seconds: 0}
end

return_array = []
i = 0
while i < n
  produce
    r = 1 "Yeast cDNA" of rna_iso[i]
    note: "Keep the tubes on the bench to use in the next protocol"
  end
  return_array = append(return_array, r[:id])
  i = i+1
end

log
  return: {cdna_array: return_array}
end

release concat(rna_iso, nuc_water)
