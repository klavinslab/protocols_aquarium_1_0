argument
  Transformed_yeast_plate: sample array("Plate"), "A plate with yeast colonies"
end

num = length(Transformed_yeast_plate)

step
 description: "This protocol describes how to make an overnight yeast suspension"
 warning: "You're going to make %{num} overnight suspension tubes"
end

take
  test_tube = num "14 mL Test Tube"
  plate = item Transformed_yeast_plate
  media_bottle = 1 "800 mL YPAD liquid (sterile)"
  falcon_tube = 1 "50 mL Falcon Tube"
end

ii = 0
r = []

while ii < length(Transformed_yeast_plate)

  produce
      y = 1 "Overnight suspension culture" from plate[ii]
  end
  
  r = append(r,y[:id])
  ii=ii+1
end

log
  return: { yeast_overnight_suspension: r }
end

release concat(falcon_tube, plate, media_bottle)
