information "Dilute overnight culture to grow cells into log phase for testing purposes"

argument
  yeast_overnight_id: sample, "Choose the plate you intended to do overnight suspension"
end

take
  yeast_overnight = item yeast_overnight_id
  yeast_media = 1 "50 mL SC liquid aliquot (sterile)"
  test_tube = 1 "14 mL Test Tube"
end

step
  description: "Prepare media in test tube"
  check: "Label a 14 mL tube with your initials AND date"
  check: "Pipette 2 mL of SC liquid aliquot into the labeled 14 mL tube"
end

step
  description: "Make a 1:100 dilution"
  check: "Use 10 µL pipettor to pipette 2 µL from tube %{yeast_overnight_id} into the newly labeled test tube, making sure touch the media."
  check: "Choose to dispose the yeast overnight suspension tube in the next release page."
end

release [yeast_overnight[0],yeast_media[0]]

produce
  y = 1 "Yeast Overnight Suspension" from yeast_overnight[0]
  note: "Place the test tube in 30 C incubator shaker at B13.125"
  location: "B13.125"
  release test_tube
end
