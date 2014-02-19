argument
  #rna_id: sample, "The lysed RNA"
  rxn_mix: sample, "Select te 5x iScript reaction mix"
  rev_enzyme: sample, "Select the iScript reverse transcriptase"
  rna_yeast: sample, "This is the isolated RNA"
  rna_conc: number
end

take
  react_mix = item rxn_mix
  iscript_enz = item rev_enzyme
  iso_rna = item rna_yeast
  nucwater = 1 "Nuclease Free Water"
end

step
  description: "This protocol prepares cDNA to be used in qPCR"
end

step
  description: "Label a 0.2 mL PCR tube. Write your initials on it."
  note: "Prior to moving forward check that your iScript reaction mix has generated any precipitation upon thawing." 
  bullet: "If precipitation has occured, please mix thoroughly to resuspend, before moving forward"
end

desvolrna= 500/rna_conc
nucwat=15-desvolrna

step 
  description: "Prepare Reaction"
  check:"Pipet 4 µL of 5x iScript reaction mix into the labeled PCR tube."
  check: "Pipet 1 µL of iScript reverse transcriptase into the labeled PCR tube"
  check: "Pipet %{nucwat}µL of Nuclease-free water into the labeled PCR tube"
  check: "Pipet %{desvolrna}µL of RNA template into the labeled PCR tube"
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
  r = 1 "Yeast cDNA" of "target_strain"
  note: "Keep the tube on the bench to use in the next protocol"
end

log
  return: {Yeast_cDNA_id: r[:id]}
end

release [iso_rna[0]]
