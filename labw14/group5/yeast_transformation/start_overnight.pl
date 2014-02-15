argument
  transformed_yeast_plate: sample array, "A plate with yeast colonies"
end

num = length(transformed_yeast_plate)

step
 description: "This protocol describes how to make an overnight yeast suspension"
 warning: "You're going to make %{num} overnight suspension tubes"
end

take
  test_tube    = num "14 mL Test Tube"
  falcon_tube  = 1 "50 mL YPAD liquid aliquot (sterile)"
  plate        = item transformed_yeast_plate
end

step
  description: "Preparing yeast overnight culture tubes"
  note: "Label  %{num}  14ml falcon tubes with your name and today's date"
end

ii  = 0
ind = 0
r   = []

while ii < length(transformed_yeast_plate)

  ind = ind + 1

#  if ()
#    take another tube
#  end

  step
    description: "Making yeast overnight culture tube"
    bullet: "Using 1000 μl pippete pour 2 ml of YPAD media into the tube."
  end

  step
    description: "Inoculating yeast overnight culture" # %{transformed_yeast_plate[ii][:id]}"
    bullet: "Take the %{transformed_yeast_plate[ii][:id]} yeast plate."
    bullet: "Find a colony that is not touching any other colony."
    bullet: "Take a 200 μL tip (the one used by the 10-100 μL or 20-200 μL pipettor) by hand."
    bullet: "With the pipette tip, scrape up the colony and then mix it into one of the tube N%{ind}.
      Scrape the end of the tip against the wall of the tube below the liquid level to ensure the colony has been deposited."
  end

  produce
    y = 1 "Yeast Overnight Suspension" from plate[ii]
    release test_tube[ii]
    note: "Write the above id number on the tube's side. Place the tube in the 30 C Shaker Incubator"
    location:"B13.125"
  end

  r = append(r,y[:id])
  ii=ii+1
end

log
  return: { yeast_overnight_suspension: r }
end

#release plate
release concat(falcon_tube, plate)
