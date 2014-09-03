information "Dilute overnight culture to grow cells into log phase for testing purposes"

argument
  yeast_overnight_ids: sample ("Yeast Strain") array, "Choose the culture to dilute" 
end

n = length(yeast_overnight_ids)
num_tubes = 2*n
take
  yeast_overnights = item yeast_overnight_ids
  yeast_media = 1 "50 mL SC liquid aliquot (sterile)"
  test_tubes = num_tubes "14 mL Test Tube"
end

yeast_overnight_output_ids = []
i = 0
while i < n 
  yeast_overnight = yeast_overnights[i]
  yeast_overnight_id = yeast_overnight_ids[i]
  step
    description: "Prepare media in test tube"
    check: "Label a 14 mL tube with your initials" 
    check: "Pipette 2 mL of SC liquid aliquot into the labeled 14 mL tube"
  end

  step
    description: "Make a 1:100 dilution"
    check: "Use 100 µL pipettor to pipette 20 µL from tube %{yeast_overnight_id} into the newly labeled test tube, making sure touch the media."
  end

  produce
    overnight = 1 "Yeast Overnight Suspension" from yeast_overnight
    note: "Place the test tube in 30 C incubator shaker at B13.125"
    location: "B13.125"
    release test_tubes[2*i]
  end

  yeast_overnight_output_ids = append(yeast_overnight_output_ids, overnight[:id])
  
  step
    description: "Prepare media plus auxin in test tube"
    check: "Label another 14 mL tube with your initials and also write auxin on the tube" 
    check: "Pipette 2 mL of SC liquid aliquot into the labeled 14 mL tube"
    check: "Pipette 4 µL of 10 mM auxin into the 14 mL tube"
  end

  step
    description: "Make a 1:100 dilution"
    check: "Use 100 µL pipettor to pipette 20 µL from tube %{yeast_overnight_id} into the newly labeled test tube, making sure touch the media."
    check: "Choose to dispose the yeast overnight suspension tube in the next release page."
  end

  produce
    overnight = 1 "Yeast Overnight Suspension" from yeast_overnight
    note: "Place the test tube in 30 C incubator shaker at B13.125"
    location: "B13.125"
    release test_tubes[2*i+1]
  end

  yeast_overnight_output_ids = append(yeast_overnight_output_ids, overnight[:id])

  i = i + 1
end

release yeast_overnights
release yeast_media

log
  return: {yeast_overnight_output_ids: yeast_overnight_output_ids}
end

