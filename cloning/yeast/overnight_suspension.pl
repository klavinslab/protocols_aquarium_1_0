information  "This protocol describes how to perform an overnight suspension from a plate"
argument
  yeast_plate_id: sample, "Choose the plate you intended to do overnight suspension"
end

take
  note: "Use a test tube rack to retrieve the 14 mL Test Tube"
  yeast_plate = item yeast_plate_id
  yeast_media = 1 "50 mL SC liquid aliquot (sterile)"
  test_tube = 1 "14 mL Test Tube"
end

step
  description: "Prepare overnight suspension media"
  check: "Label a 14 mL tube with your initials AND date"
  check: "Pipette 2 mL of SC liquid aliquot into the labeled 14 mL tube"
end

step
  description: "Inoculate cells from plate to tube"
  check: "Select a medium size isolated colony prior to opening plate. Mark desired colony with circle and intials and date"
  check: "Take a sterile pipette tip, pick up your desired colony by gently scraping the tip to the colony."
  check: "Tilt 14 mL tube such that you can reach the broth with your tip."
  check: "Scrape colony into broth, using a swirling motion"
end

release [yeast_plate[0],yeast_media[0]]

produce
  y = 1 "Yeast Overnight Suspensions" from yeast_plate[0]
  note: "Place the test tube in 30 C incubator shaker at B13.125"
  location: "B13.125"
  release test_tube
end
