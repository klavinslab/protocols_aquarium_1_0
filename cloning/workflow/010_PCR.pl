argument
  initials: string, "Your initials or another 2-3 letter identifier for tube labeling"
  enzyme_id: sample("Enzyme"), "The Phsion HF Master Mix stock"
  fragment_names: string array, "Fragment Names"
  forward_ids: sample("Primer") array, "Forward Primers"
  reverse_ids: sample("Primer") array, "Reverse Primers"
  template_ids: sample array, "Template (diluted plasmid or other template DNA)"  
  tanneal: number, "The anneal temperature in degrees C"
end

take
  phusion_stock = item enzyme_id
end
take
    forward_primer_stock = item unique(forward_ids)
    reverse_primer_stock = item unique(reverse_ids)
    plasmid_stock = item unique(template_ids)
end

step
  description: "This protocol prepares PCR reactions in a strip-well tube."
end

step
  description: "Grab a 12 strip-well PCR tube and cap, and rest it in a green PCR tube rack. With the numbers FACING YOU, do the following:"
  check: "Label the right most well with the letters %{initials}"
  check: "Label the left most well with the letter A"
  note: "These wells will be refered to as 1 - 12"
end
if length(forward_ids) > 12
  step
    description: "Grab a second 12 strip-well PCR tube and cap, and rest it in a green PCR tube rack. With the numbers FACING YOU, do the following:"
    check: "Label the right most well with the letters %{initials}"
    check: "Label the left most well with the letter B"
    note: "These wells will be refered to as 13 - 24"
  end
end
if length(forward_ids) > 24
  step
    description: "Grab a third 12 strip-well PCR tube and cap, and rest it in a green PCR tube rack. With the numbers FACING YOU, do the following:"
    check: "Label the right most well with the letters %{initials}"
    check: "Label the left most well with the letter C"
    note: "These wells will be refered to as 25 - 36"
  end
end
if length(forward_ids) > 36
  step
    description: "Grab a fourth 12 strip-well PCR tube and cap, and rest it in a green PCR tube rack. With the numbers FACING YOU, do the following:"
    check: "Label the right most well with the letters %{initials}"
    check: "Label the left most well with the letter D"
    note: "These wells will be refered to as 37 - 48"
  end
end
if length(forward_ids) > 48
  step
    description: "Grab a fourth 12 strip-well PCR tube and cap, and rest it in a green PCR tube rack. With the numbers FACING YOU, do the following:"
    check: "Label the right most well with the letters %{initials}"
    check: "Label the left most well with the letter E"
    note: "These wells will be refered to as 49 - 60"
  end
end

y=length(forward_ids)

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
  check: "Set the anneal temperature to %{tanneal}, this is the 3rd temperature (default 70). Don't change the extension temperature of 72."
  check: "hit 'run' and select 50ul"
  image: "thermal_cycler_home"
end

release phusion_stock
release concat(concat(forward_primer_stock,reverse_primer_stock),plasmid_stock)

x=0
while x < y
  produce
    q = 1 "PCR Result" of fragment_names[x]
    location: "Thermocycler"
  end
  x = x+1
end
