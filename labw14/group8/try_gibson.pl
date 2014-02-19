argument
  enzyme_id: sample("Enzyme"), "The Phsion HF Master Mix stock"
  fragment_names: string array, "Result Fragment Names"
  forward_ids: sample("Primer") array, "Forward Primers"
  reverse_ids: sample("Primer") array, "Reverse Primers"
  template_ids: sample("Plasmid") array, "Plasmid Templates"  
  tanneal: number, "The anneal temperature in degrees C"
end

# idea TODO
# build up a data structure using loops etc that define experiment
# then iterate through that data structure, showing it

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
  check: "Label the right most well with the letters DY"
  check: "Label the left most well with the letter A"
  note: "These wells will be refered to as 1 - 12"
end
if length(forward_ids) > 12
  step
    description: "Grab a second 12 strip-well PCR tube and cap, and rest it in a green PCR tube rack. With the numbers FACING YOU, do the following:"
    check: "Label the right most well with the letters DY"
    check: "Label the left most well with the letter B"
    note: "These wells will be refered to as 13 - 24"
  end
end
if length(forward_ids) > 24
  step
    description: "Grab a third 12 strip-well PCR tube and cap, and rest it in a green PCR tube rack. With the numbers FACING YOU, do the following:"
    check: "Label the right most well with the letters DY"
    check: "Label the left most well with the letter C"
    note: "These wells will be refered to as 25 - 36"
  end
end
if length(forward_ids) > 36
  step
    description: "Grab a fourth 12 strip-well PCR tube and cap, and rest it in a green PCR tube rack. With the numbers FACING YOU, do the following:"
    check: "Label the right most well with the letters DY"
    check: "Label the left most well with the letter D"
    note: "These wells will be refered to as 37 - 48"
  end
end
if length(forward_ids) > 48
  step
    description: "Grab a fourth 12 strip-well PCR tube and cap, and rest it in a green PCR tube rack. With the numbers FACING YOU, do the following:"
    check: "Label the right most well with the letters DY"
    check: "Label the left most well with the letter E"
    note: "These wells will be refered to as 49 - 60"
  end
end

num_forwards=length(forward_ids)

step 
  description: "Pipet 19 µL molecular grade water into wells 1 through %{num_forwards}."
  note:"Be careful to pipette into the bottom of the tube, not onto the side of the tube."
end

x=0
while x < num_forwards
  a=template_ids[x]
  z=x+1
  step 
    description: "Pipet 1 µL of plasmid with id %{a} into well %{z}."
  end
  x = x+1
end

x=0
while x < num_forwards
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
while x < num_forwards
  produce
    q = 1 "PCR Result" of fragment_names[x]
    data # put the actual numbers describing what concentrations were used here
        # can I put a for loop here to put concentrations in ?
        # if not, another reason to build up list of the tubes and ops to apply
        concentration: 123
    end
    location: "Thermocycler"
  end
  x = x+1
end
