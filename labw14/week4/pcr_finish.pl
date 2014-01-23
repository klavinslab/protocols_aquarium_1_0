argument
  names: string array, "list of PCR product names"
end

step
  description: "Go to the thermal cycler to pick up the PCR tubes you put in the previous pcr_prepare protocol."
  note: "Put them on you bench after you picked up the PCR tube"
end

ii= 0
rary = []
while ii<length(names)
  produce
    r = 1 "PCR Result" of names[ii]
    note: "Keep the tube on the bench to use in the next protocol.  (no need to edit the location below)"
    location: "Bench"
  end
  rary = append(rary,r)
  ii = ii+1
end

