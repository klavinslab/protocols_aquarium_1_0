argument
  volume: number, "The elution volume in ul"
  strain_id: sample("Transformed E coli Strain"), "The transformed E. coli strain that you are using"
  plasmid_id: sample("Plasmid"), "The name of the plasmid you are purifying"  
end

step
  description: "This protocol isolates plasmid DNA from an overnight culture of transformed E. coli"
end

take
  overnight = item strain_id
end

y=length(strain_id)

step
  description: "Grab %{y} eppendorf tubes and label them"
  note: ""
end



step 
  description: "Pipet 19 µL molecular grade water into wells 1 through %{y}."
  note:"Be careful to pipette into the bottom of the tube, not onto the side of the tube."
end

x=0
while x < y
  a=template_ids[x]
  z=x+1
  step 
    description: "Pipet 1 µL of plasmid with id %{a} into well %{z}."
  end
  x = x+1
end

x=0
while x < y
  a=forward_ids[x]
  b=reverse_ids[x]
  z=x+1
  step 
    description: "Add both forward and reverse primers"
    check: "Pipet 2.5 µL of primer with id %{a} into well %{z}."
    check: "Pipet 2.5 µL of primer with id %{b} into well %{z}."
  end
  x = x+1
end

step 
  description:"Pipet 25 µL Phusion Master Mix with id %{enzyme_id} into wells 1 through %{y}."
  note:"USE A NEW PIPETTE TIP FOR EACH WELL AND PIPETTE UP AND DOWN TO MIX"
end

step
  description: "Begin the PCR reaction with a thermal cycler"
  check: "Put the cap on the PCR strip tubes and press each one very hard to make sure they are sealed."
  check: "Place the tube into an available thermal cycler and close the lid"
  check: "Click Home then click Saved Protocol, choose DAVID, choose CLONEPCR."
  check: "Set the anneal temperature to %{tanneal}"
  check: "hit 'run' and select 50ul"
  image: "thermal_cycler_home"
end

release [phusion_stock[0]]
release forward_primer_stock
release reverse_primer_stock
release plasmid_stock

x=0
while x < y
  produce
    q = 1 "PCR Result" of fragment_names[x]
    location: "Thermocycler"
  end
  x = x+1
end
