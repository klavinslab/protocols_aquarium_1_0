arguments
  initials: string, "Your initials or another 2-3 letter identifier for tube labeling"
  enzyme_id: sample("Enzyme"), "The Phusion HF Master Mix stock"
  strain_names: string array, "Name of strain that lysate is from"
  forward_ids: sample("Primer") array, "Forward Primers"
  reverse_ids: sample("Primer") array, "Reverse Primers"
  template_ids: sample array, "Template lysates"
  tanneal: number, "The anneal temperature in degrees C"
  ext_time: number, "The extension time in minutes"
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

#y is used all over the place.  It really needs to be refactored to a readable
#identifier.  
y=length(forward_ids)

step
  description: "Pipet 5 µL molecular grade water into wells 1 through %{y}."
  note:"Be careful to pipette into the bottom of the tube, not onto the side of the tube."
end

x=0
while x < y
  a=template_ids[x]
  z=x+1
  step
    description: "Pipet 1 µL of lysate/template with id %{a} into well %{z}."
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
    check: "Pipet 0.75 µL of primer with id %{a} into well %{z}."
    check: "Pipet 0.75 µL of primer with id %{b} into well %{z}."
  end
  x = x+1
end

step
  description:"Pipet 7.5 µL Phusion Master Mix with id %{enzyme_id} into wells 1 through %{y}."
  note:"USE A NEW PIPETTE TIP FOR EACH WELL AND PIPETTE UP AND DOWN TO MIX"
end

step
  description: "Begin the PCR reaction with a thermal cycler"
  check: "Put the cap on the PCR strip tubes and press each one very hard to make sure they are sealed."
  check: "Place the tube into an available thermal cycler and close the lid"
  check: "Click Home then click Saved Protocol, choose DAVID, choose QPCR."
  check: "Set the anneal temperature to %{tanneal}, this is the 3rd temperature (default 70). Don't change the extension temperature of 72."
  check: "Set the extension time to %{ext_time}, this is the time of the 3rd step in the loop which is at 72C."
  check: "hit 'run' and select 50ul"
  image: "thermal_cycler_home"
end

release phusion_stock
release concat(concat(forward_primer_stock,reverse_primer_stock),plasmid_stock)

#TODO: refactor with silent produces
step
  description: "Ignore produce locations"
  note: "For the following produced items, do not move the tubes - ignore the location listed."
end

x=0
first = 0
last = 0
fids = []
while x < y
  produce
    q = 1 "QPCR result" of strain_names[x]
    location: "R4.300"
    data
      from: template_ids[x]
    end
  end

  fids = append(fids,q[:id])

#TODO: fix this.  There is NO guarentee that items will be produced in sequence!
  if x == 0
    first = q[:id]
  end
  if x == y - 1
    last = q[:id]
  end

  x = x + 1
end


if length(fragment_names) > 1
  step
    description: "Label tape and tube rack with PCR Result IDs"
    note: "Label the tape (exactly) with: %{first} - %{last}."
  end
else
  step
    description: "Label tape and tube rack with PCR Result IDs"
    check: "Label the tape (exactly) with: %{first}."
    check: "Apply the tape to both the thermal cycler and a green 12-well tube rack."
  end
end

#NOTE: removing some return values may break metacols.  
#      It is fine to add more though.
log
  return: {QPCR_ids: fids, params: {QPCR_ids: fids}}
end
