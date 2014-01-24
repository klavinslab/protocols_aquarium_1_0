argument
  gels: sample array, "The gel lanes you got after run the gel"
end


ii = 0
y = []
while ii<length(gels)
  take
    temp = item gels[ii]
  end
  y = append(y,temp[0])
  ii= ii+1
end

step
  description: "Take the gel out of gel box and put it on transilluminator"
  note: "take a look"
  image: "slide_gel"
end

step
  description: "Take razor blade from shelf above station"
  note: "Razor blades are located in a petri dish next to the goggles. Take one out and carefully
  clean the blade using ethanol and a kimwipe"
  image: "spray_blade"
end

step
  description: "Trim the gel slice"
  note: "Try to remove as much excess gel as possible. Do not remove any gel that contains the band
  as this will limit the amount of DNA that can be extracted. In essence, try to cut away everything
  that is not glowing. It is important to trim the gel as excess gel will complicate the next protocol."
end

step
  description: "Put the gel slice into a 1.5 mL tube"
  note: "Slide the gel slice onto the razor blade, open the tube and push the slice in. If the
  slice is to big, trim down excess gel. Again, do not trim gel that contains the band, only
  excess gel around the band."
  image: "slice_tube"
end

step
  description: "Clean up the transilluminator and gel station"
  note: "Turn off the transilluminator. Dispose of the gel and any gel fragments by placing it in the waste container.
  Spray the surface of the transilluminator with ethanol and wipe until dry using kimwipes or paper towel. If the
  lights in the room are turned off, turn the lights back on. Remove the UV goggles and put them back where you
  found them."
end

ii=0
ret=[]
while ii<length(y)
  produce
    r = 1 "Gel Slice" from y[ii]
    release y[ii]
  end
  ret = append(ret,r[:id])
  ii = ii + 1
end

log
  return: {Gel_Slice_ids: ret }
end
