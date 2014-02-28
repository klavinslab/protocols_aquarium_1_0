argument
  pfwd: sample array, "forward primers"
  prev: sample array, "reverse primers"
  enzyme_id: sample, "The Phsion HF Master Mix stock"
end

#unhardcode this later by passing results of boil.
samples = [1,1,2,2,3,3,4,4]
n_samp = length(pfwd)


take
  fwd = item unique(pfwd)
  revs = item unique(prev)
  phusion_stock = item enzyme_id
end

step
  description: "Take %{n_samp} 0.2 mL PCR tubes from PCR strip. Write your initials on it. Label from left to right as 1 to %{n_samp}."
end

step
  description: "Prepare reaction"
  check: "Pipet 5 µL molecular grade water into each newly labeled PCR tube 1-%{n_samp}."
end

step
  description: "Spin down the boiled cells 1-3 in the microcentrifuge on your bench for 1 minute"
  note: "The boiled cell 1-3 are three PCR tubes you took from thermal cylcler from your previous protocol."
  warning: "Be extremely careful not to distrube the spun tubes.  They won't look any different but even the slightest tap can be detrimental."
end

tube_number = 0
while tube_number<n_samp
  tube_number = tube_number+1
  t = samples[tube_number]
  f = pfwd[tube_number]
  r = prev[tube_number]
  step 
    description: "Prepare reaction for tube %{tube_number}"
    check: "Pipet 3 uL of boiled cell %{t} into tube %{tube_number}."
    check: "Pipet 1 uL of primer with id %{f} into tube %{tube_number}."
    check: "Pipet 1 uL of primer with id %{r} into tube %{tube_number}."
    check: "Use the tip to gently mix."
    note: "Be careful to pipette into the liquid, not the side of the tube. Always use a new tip."
    warning: "Be extremely careful not to distrube the boiled cell tubes. They won't look any different but even the slightest tap can be detrimental."
  end
end

step
  description: "Prepare reaction"
  check: "Pipet 10 uL of Phusion HF Master Mix with id %{enzyme_id} into each PCR tube 1-%{n_samp}."
  note: "Use the tip to gently mix after each pipette."
end

release phusion_stock


step
  description: "Place the tube strip into thermal cycler T2 at B3.335"
end

step
  description: "Choose program on the thermal cycler"
  note: "Click Home then click Saved Protocol, choose LABW14 folder, choose COLONYPCR. Wait for all other groups to load in their samples."
  image: "thermal_cycler_home"
end

step
  description: "hit 'run' on the thermal cycler and select 20 uL setting."
  note: "Coordinate with your fellow classmates to put all their samples before hit run."
  image: "thermal_cycler_select"
end


release fwd
release revs


