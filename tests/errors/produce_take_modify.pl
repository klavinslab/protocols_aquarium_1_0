argument
  primer_ids: sample("Primer") array, "Enter primer stocks"
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

x=0
while x < len
  y=newid[x]
  modify 
      y[x]
      inuse: 1
  end
  x=x+1
end

release a
release primer_stock
