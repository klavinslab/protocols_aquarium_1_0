argument
  pfwds: sample, "The forward primer"
  prev1s: sample array, "Reverse primers for knockout test group"
  prev2s: sample array, "Reverse primers for control group"
  #templates: sample array, "The templates you just made" #just assume you have it
  enzyme_id: sample, "The Phsion HF Master Mix stock"
  sample_count: number, "Number of boiled cell samples"
end

take
  fwds = item pfwds
  rev1s = item unique(prev1s)
  rev2s = item unique(prev2s)
  #genomicdna = item templates
  phusion_stock = item enzyme_id
end

pcr_count = sample_count*2
step
  description: "Take %{pcr_count} 0.2 mL PCR tubes from PCR strip. Write your initials on it. Label 1-%{pcr_count} from left to right."
end

step
  description: "Prepare reaction"
  check: "Pipette 5 µL molecular grade water into each newly labeled PCR tube."
end

step
  description: "Spin down boiled cell tubes 1-%{sample_count} in the microcentrifuge on your bench for 1 minute"
  note: "The boiled cell tubes 1-%{sample_count} are the PCR tubes you took from thermal cycler from your previous protocol."
  warning: "Be extremely careful not to disturb the spun tubes.  They won't look any different but even the slightest tap can be detrimental."
end

boiled_tube = 0
pcr_tube = 0
while boiled_tube < sample_count
  pfwd = pfwds[boiled_tube]
  prev1 = prev1s[boiled_tube]
  prev2 = prev2s[boiled_tube]
  boiled_tube = boiled_tube + 1
  pcr_tube = pcr_tube+1
  
  step 
    description: "Prepare reaction for tube %{pcr_tube} -- boiled cell %{boiled_tube} knockout test group"
    check: "Pipet 3 µL of boiled cell %{boiled_tube} into tube %{pcr_tube}."
    check: "Pipet 1 µL of primer with id %{pfwd} into tube %{pcr_tube}."
    check: "Pipet 1 µL of primer with id %{prev1} into tube %{pcr_tube}."
    check: "Use the tip to gently mix."
    note: "Be careful to pipette into the liquid, not the side of the tube. Always use a new tip."
  warning: "Be extremely careful not to disturb the boiled cell tubes. They won't look any different but even the slightest tap can be detrimental."
  end
  
  pcr_tube = pcr_tube+1
  step 
    description: "Prepare reaction for tube %{pcr_tube} -- boiled cell %{boiled_tube} control group"
    check: "Pipet 3 µL of boiled cell %{boiled_tube} into tube %{pcr_tube}."
    check: "Pipet 1 µL of primer with id %{pfwd} into tube %{pcr_tube}."
    check: "Pipet 1 µL of primer with id %{prev2} into tube %{pcr_tube}."
    check: "Use the tip to gently mix."
    note: "Be careful to pipette into the liquid, not the side of the tube. Always use a new tip."
    warning: "Be extremely careful not to disturb the boiled cell tubes. They won't look any different but even the slightest tap can be detrimental."
  end
  
end

step
  description: "Prepare reaction"
  check: "Pipet 10 µL of Phusion HF Master Mix with id %{enzyme_id} into each PCR tube."
  note: "Use the tip to gently mix after each pipette."
end

release phusion_stock

release fwd
release revs

step
  description: "Place the tube strip into thermal cycler T2 at B3.335"
  note: "Remember to place caps on the PCR tubes"
end

step
  description: "Choose program on the thermal cycler"
  note: "Click Home then click Saved Protocol, choose LABW14 folder, choose COLONYPCR. Hit 'run' to start"
  image: "thermal_cycler_home"
end

step
  description: "When pcr finishes, return pcr tubes to bench"
end

log 
  return: {pcr_count: pcr_tube}
end



