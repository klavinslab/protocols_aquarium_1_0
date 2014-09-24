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
    data
      concentration: 1
      solvent: "EB buffer"
    end
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
end



x=0
y = 0
z = 0
final_conc = 1  # ng/uL
stock_vol = 1   # uL
vol = 0
while x < len
  y=newid[x]
  z=plasmid_stock[x][:id]
  conc=plasmid_stock[x][:data][:concentration]  # ng/uL
  buffer_vol = 1 * conc / final_conc - stock_vol  # uL
  step
    description: "Label a tube and add plasmid to make a diluted stock"
    check: "Grab an unlabeled tube"
    check: "Label the tube with the ID number %{y}"
    check: "Pipette %{buffer_vol} uL of EB buffer to the newly labeled tube with ID %{y}"
    check: "Pipette %{stock_vol} uL from the tube with ID %{z} into the newly labeled tube with ID %{y}"
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
