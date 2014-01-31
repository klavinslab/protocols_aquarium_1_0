argument
  tanneal: number, "The anneal temperature in degrees C"
  enzyme_id: sample("Enzyme"), "The Phsion HF Master Mix stock"
  forward_ids: sample("Primer") array, "Forward Primers"
  reverse_ids: sample("Primer") array, "Reverse Primers"
  template_ids: sample("Plasmid") array, "Plasmid Templates"  
end

take
  phusion_stock = item enzyme_id
end
take
    forward_primer_stock = item unique(forward_ids)
end
take
    reverse_primer_stock = item unique(reverse_ids)
end
take
    plasmid_stock = item unique(template_ids)
end

step
  description: "This protocol prepares PCR reactions in a strip-well tube."
end

step
  description: "Grab a 12 strip-well PCR tube and cap, and rest it in a green PCR tube rack. With the numbers FACING YOU, do the following:"
  check: "Label the left most well with your initials"
  check: "Label the right most well with the number 1"
  note: "These wells will be refered to as 1 - 12"
end

if length(forward_ids) > 12
  step
    description: "Grab a second 12 strip-well PCR tube and cap, and rest it in a green PCR tube rack. With the numbers FACING YOU, do the following:"
    check: "Label the left most well with your initials"
    check: "Label the right most well with the number 2"
    note: "These wells will be refered to as 13 - 24"
  end
end

if length(forward_ids) > 24
  step
    description: "Grab a third 12 strip-well PCR tube and cap, and rest it in a green PCR tube rack. With the numbers FACING YOU, do the following:"
    check: "Label the left most well with your initials"
    check: "Label the right most well with the number 3"
    note: "These wells will be refered to as 25 - 36"
  end
end

y=length(forward_ids)

step 
  description: "Begin by adding water"
  note:"Pipet 19 µL molecular grade water into wells 1 through %{y}."
  warning: "Be careful to pipette into the liquid, not the side of the tube."
end

x=0
while x < y-1
  step 
    description: "Pipet 1 µL of plasmid with id %{template_ids[x]} into well %{x+1}."
  end
  x = x+1
end

x=0
while x < y-1
  step 
    description: "Add both forward and reverse primers"
    check: "Pipet 2.5 µL of primer with id %{forward_ids[x]} into well %{x+1}."
    check: "Pipet 2.5 µL of primer with id %{reverse_ids[x]} into well %{x+1}."
  end
  x = x+1
end

step 
  description: "Finally, add Phusion Master Mix. USE A NEW PIPETTE TIP FOR EACH WELL AND PIPETTE UP AND DOWN TO MIX"
  note:"Pipet 25 µL Phusion Master Mix with id %{enzyme_id} into wells 1 through %{y}."
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
