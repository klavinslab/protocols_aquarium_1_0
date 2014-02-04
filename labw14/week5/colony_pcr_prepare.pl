argument
  pfwd: sample, "The forward primer"
  prev: sample array, "two reverse primers"
  #templates: sample array, "The templates you just made" #just assume you have it
  enzyme_id: sample, "The Phsion HF Master Mix stock"
end

take
  fwd = item pfwd
  revs = item prev
  #genomicdna = item templates
  phusion_stock = item enzyme_id
end

step
  description: "Take eight 0.2 mL PCR tubes from PCR strip. Write your initials on it. Label from left to right as 1 to 8"
end

step
  description: "Spin the boiled cells 1-4 down in the microcentrifuge on your bench for 1 minute"
  warning: "Be extremely careful not to distrube the spun tubes.  They won't look any different but even the slightest tap can be detrimental."
end


ii = 0
while ii < length(templates)
  t = ii+1
  jj = 0
  while jj < length(prev)
    r = prev[jj]
    step 
      description: "Prepare Reaction"
      check:"Pipet 5 µL molecular grade water into the newly labeled PCR tube."
      check: "Pipet 3 µL of boiled cell %{t} into the tube."
      check: "Pipet 1 µL of primer with id %{fwd} into the tube."
      check: "Pipet 1 µL of primer with id %{r} into the tube."
      check: "Pipet 10 µL of Phusion Master Mix with id %{enzyme_id} into the tube."
      check: "Use the tip to gently mix."
      note: "Be careful to pipette into the liquid, not the side of the tube."
    end
  end
end

release phusion_stock

step
  description: "You will now be asked to use the lab thermal cycler"
  note: "The thermal cycler will be shared by all groups."
  image: "thermal_cycler_off"
end

step
  description: "Place the tube strip into thermal cycler T2 at B3.335"
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


release [fwd[0],phusion_stock[0]]
release revs


