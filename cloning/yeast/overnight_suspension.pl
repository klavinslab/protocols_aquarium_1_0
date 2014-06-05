information  "This protocol describes how to perform an overnight suspension from a plate"
argument
  yeast_plate_id: sample, "Choose the plate you intended to do overnight suspension"
end

take
  yeast_plate = item yeast_plate_id
  yeast_media = 1 "50 mL SC liquid aliquot (sterile)"
  test_tube = 1 "14 mL Test Tube"
end

produce
  y = 1 "Yeast Overnight Suspensions" from yeast_plate[0]
  note: "Place in 30 C incubator shaker at B13.125"
  location: "B13.125"
end
