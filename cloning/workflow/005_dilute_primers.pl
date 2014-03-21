argument
  primer_ids: sample("Primer") array, "Enter the primer IDs that you wish to make a diluted working stock of"
end
take
    primer_stock = item unique(primer_ids)
end
len=length(primer_ids)

x=0
newid=[0]
newitem=[0]
while x < len
  produce silently
    q = 1 "Primer Aliquot" of primer_stock[x][:name]
  end
  newid[x]=q[:id]
  newitem[x]=q
  x = x+1
end

step
  description: "Prepare sterile Eppendorf tubes"
  check: "Grab %{len} eppendorf tubes"
  check: "Put a circular label sticker on the cap of each tube."
  check: "Pipette 90ul of molecular grade water into each tube."
end


x=0
while x < len
  y=newid[x]
  z=primer_stock[x][:id]
  step
    description: "Label a tube and add primer to make a diluted stock"
    check: "Grab an unlabeled tube"
    check: "Label the tube with the ID number %{y}"
    check: "Pipette 10ul from the tube with ID %{z} into the newly labeled tube with ID %{y}"
  end
  x=x+1
end

step
  description: "Ignore the following take"
end
take
  item newitem
end
step
  description: "Do NOT ignore the following release"
end

release newitem
release primer_stock
