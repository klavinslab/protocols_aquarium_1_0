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
  description: "newid: %{newid}, newitem: %{newitem}"
end
take
  a = item newid
end
release a
release primer_stock
