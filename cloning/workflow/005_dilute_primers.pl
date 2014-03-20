argument
  primer_ids: sample("Primer") array, "Enter the primer IDs that you wish to make a diluted working stock of"
end

take
    primer_stock = item unique(primer_ids)
end
len=length(primer_ids)

step
  description: "Label sterile Eppendorf tubes"
  check: "Grab %{len} eppendorf tubes"
  check: "Put a circular label sticker on the cap of each tube."
end





x=0
while x < y
  produce
    q = 1 "PCR Result" of fragment_names[x]
    location: "Thermocycler"
  end
  x = x+1
end







release primer_stock
