argument
  rxn_mix: sample, "Select the 5x iScript reaction mix"
  rev_enzyme: sample, "Select the iScript reverse transcriptase"
  rna_yeast1: sample, "This is the isolated RNA from strain 1"
  rna_yeast2: sample, "This is the isolated RNA from strain 2"
  rna_conc1: number
  rna_conc2: number
end

take
  react_mix = item rxn_mix
  iscript_enz = item rev_enzyme
  iso_rna1 = item rna_yeast1
  iso_rna2 = item rna_yeast2
  nuc_water = 1 "Nuclease Free Water"
end

step
  description: "This protocol prepares cDNA to be used in qPCR"
  note: "Using template RNA you will synthesize complementary DNA to be used later"
end

step
  description: "Label two 0.2 mL PCR tubes. Write your initials on them."
  note: "Prior to moving forward check that your iScript reaction mix has not generated any precipitation upon thawing." 
  bullet: "If precipitation has occured, please mix thoroughly to resuspend, before moving forward"
end

desvolrna1= 500/rna_conc1
nucwat1=15-desvolrna1
desvolrna2= 500/rna_conc2
nucwat2=15-desvolrna2

step 
  description: "Prepare Reaction 1 (from Strain 1)"
  check:"Pipet 4 µL of 5x iScript reaction mix into the labeled PCR tube."
  check: "Pipet 1 µL of iScript reverse transcriptase into the labeled PCR tube"
  check: "Pipet %{nucwat1} µL of Nuclease-free water into the labeled PCR tube"
  check: "Pipet %{desvolrna1} µL of RNA template %{rna_yeast1} into the labeled PCR tube"
  check: "Use the tip to gently mix."
  note: "Be careful to pipette into the liquid, not the side of the tube."
end

step 
  description: "Prepare Reaction 2"
  check:"Pipet 4 µL of 5x iScript reaction mix into the labeled PCR tube."
  check: "Pipet 1 µL of iScript reverse transcriptase into the labeled PCR tube"
  check: "Pipet %{nucwat2} µL of Nuclease-free water into the labeled PCR tube"
  check: "Pipet %{desvolrna2} µL of RNA template %{rna_yeast2} into the labeled PCR tube"
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
  image: "thermal_cycler_select"
end

release [react_mix[0],iscript_enz[0]]

step
  description: "*Optional Hold Stage*"
  note: "This is an optimal point to hold your sample if you do not anticipate time to finish."
  note: "If this is the case, do not remove the tube from the 4°C hold."
  timer: { hours: 0, minutes: 40, seconds: 0}
end

produce
  r = 1 "Yeast cDNA" of "rna_yeast1"
  note: "Keep the tubes on the bench to use in the next protocol"
end

produce
  s = 1 "Yeast cDNA" of "rna_yeast2"
  note: "Keep the tubes on the bench to use in the next protocol"
end

log
  return: {yeast1_cdna_id: r[:id], yeast2_cdna_id: s[:id]}
end

release [iso_rna1[0], iso_rna2[0]]
