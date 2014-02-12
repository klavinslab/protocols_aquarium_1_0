argument
  id: sample ("Transformed E coli Strain"), "We will mix this with M9 glucose to dilute the concentration"
end

step
  description: "Prepare 0.4 percent M9 glucose to mix with overnight suspension"
  note: "Click next to begin this procedure."
end

take 
  test_tube = 1 "14 mL Test Tube"
  tip = 1 "5 mL Serological Pipette Tips"
  M9 = 1 "200 mL M9 liquid Glucose"
  pipette = 1 "Serological Pipette"
end

step
  description: "Pipette 2 mL into the 14 mL test tube"
  warning: "Do not touch the pipette tip to the side of the 200 mL glucose flask!"
  bullet: "Take the test tube rack from the bench to the media station"
  bullet: "Attach the 5 mL serological pipette tip to the serological pipetter"
  bullet: "Pipette 2mL of the M9 solution into the 14 mL test tube"
end

step
  description: "Dispose of items"
  check: "Dispose of 5 mL serological tip"
end

release[M9[0]]

take
  amp = 1 "100X 1mL Ampicillin Aliquot"
  kan = 1 "200X 1mL Kanamycin Aliquot"
end

step
  description: "Pipette antibotics"
  bullet: "Pipette 20 microL of Ampicillin into the test tube"
  bullet: "Pipette 4 microL of Kanamycin into the test tube"
end

release[amp[0], kan[0]]

take
  ons = item id
end

step
  description: "Mix the overnight suspension culture into the M9 glucose solution"
  note: "Pipette 13 microL of the overnight suspension culture into the M9 solution"
end

produce
  r = 1 "Overnight suspension cultures" from ons[0]
  location: "B13.425"
end

log
  return: {ons: r}
end

step
  description: "Store solution in incubator"
  note: "Place the solution in the 37 deg shaker incubator located at B13.425"
end

release[ons[0]]

