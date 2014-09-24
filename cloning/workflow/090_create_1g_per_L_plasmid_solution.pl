# This protocol starts from plasmid stock with certain concentration, and creates 1 gn/uL solution of this plasmid.
# This solution is usually used for PCR or transformation.

argument
  plasmid_ids: sample("Plasmid") array, "Enter the plasmid IDs that you wish to make a 1 g/L solution of"
end
take
    plasmid_stock = item unique(plasmid_ids)
end
len=length(plasmid_ids)

x=0
newid=[0]
newitem=[0]
q = 0
while x < len
  produce silently
    q = 1 "1 ng/µL Plasmid Stock" from plasmid_stock[x]
  end
  newid[x]=q[:id]
  newitem[x]=q
  # Getting single plasmid
  i=plasmid_stock[x]
  # Pulling its concentration
  conc=i[:concentration]
  x = x+1
end

step
  description: "Prepare sterile Eppendorf tubes"
  check: "Grab %{len} eppendorf tubes"
  check: "Put a circular label sticker on the cap of each tube."
  check: "Pipette 90ul of molecular grade water into each tube."
  note: conc
  #note: "Concentration of sample is %{conc} g/L"
end


x=0
y = 0
z = 0
while x < len
  y=newid[x]
  z=plasmid_stock[x][:id]
  step
    description: "Label a tube and add plasmid to make a diluted stock"
    check: "Grab an unlabeled tube"
    check: "Label the tube with the ID number %{y}"
    check: "Pipette 10ul from the tube with ID %{z} into the newly labeled tube with ID %{y}"
  end
  x=x+1
end

step
  description: "Ignore the following take"
  check: "plasmid_stock: %{plasmid_stock}, newid: %{newid}, newitem: %{newitem}"
end

take
  a = item newid
end

step
  description: "Do NOT ignore the following release"
end

release a
release plasmid_stock
