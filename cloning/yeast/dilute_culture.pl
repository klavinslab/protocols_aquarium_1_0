information "Dilute overnight culcutre to grow cells into log phase for testing purposes"

argument
  yeast_overnight_id: sample, "Choose the plate you intended to do overnight suspension"
end

take
  yeast_overnight = item yeast_overnight_id
  yeast_media = 1 "50 mL SC liquid aliquot (sterile)"
  test_tube = 1 "14 mL Test Tube"
end

release [yeast_overnight[0],yeast_media[0]]

produce
  y = 1 "Yeast Overnight Suspension" from yeast_plate[0]
  note: "Place the test tube in 30 C incubator shaker at B13.125"
  location: "B13.125"
  release test_tube
end
