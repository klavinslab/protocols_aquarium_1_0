information  "This protocol describes how to perform an overnight suspension from a plate"
argument
  yeast_plate_ids: sample ("Yeast Strain") array, "Choose the plate you intended to do overnight suspension"
end

n = length(yeast_plate_ids)
take
  note: "Use a test tube rack to retrieve the 14 mL Test Tube"
  yeast_plates = item yeast_plate_ids
  yeast_media = 1 "50 mL SC liquid aliquot (sterile)"
  test_tube = n "14 mL Test Tube"
end

i = 0
while i < n 
yeast_plate = yeast_plates[i]
yeast_plate_id = yeast_plate_ids[i]
step
  description: "Prepare overnight suspension media"
  check: "Label a 14 mL tube with your initials"
  check: "Pipette 2 mL of SC liquid aliquot into the labeled 14 mL tube"
end

step
  description: "Inoculate cells from plate %{yeast_plate_id} to tube"
  check: "Select a medium size isolated colony prior to opening plate. Mark desired colony with circle and intials and date"
  check: "Take a sterile pipette tip (10 µL tips), pick up your desired colony by gently scraping the tip to the colony."
  check: "Tilt 14 mL tube such that you can reach the media with your tip."
  check: "Open the tube cap, scrape colony into media, using a swirling motion."
  check: "Place the tube back on the rack with cap closed."
end

step
  check: "Wrap up the plate with parafilm."
end

produce
  y = 1 "Yeast Overnight Suspension" from yeast_plate
  note: "Place the test tube in 30 C incubator shaker at B13.125"
  location: "B13.125"
  release test_tube[i]
end

i = i + 1
end

release yeast_plates
release yeast_media
