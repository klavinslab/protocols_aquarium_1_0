argument
  id: sample ("Transformed E coli Strain"), "We will mix this with M9 glucose to dilute the concentration"
end

step
  description: "Prepare 0.4%% M9 glucose to mix with overnight suspension"
  note: "Click next to begin this procedure."
end

take 
  test_tube = 1 "14 mL Test Tube"
  tip = 1 "5 mL Serological Pipette Tips"
  M9 = 1 "200 mL M9 liquid Glucose"
  pipette = 1 "Serological Pipette"
end

step
  description: "Head to the media bay"
  note: "Loggin to aquarium at the media bay in the B0 row of the lab"
end

step
  description: "Pipette M9 media into the 14 mL test tube"
  warning: "Do not touch the pipette tip to the side of the 200 mL glucose flask!"
  bullet: "Place the test tube inside a tube rack to prevent accidents while pipetting"
  bullet: "Attach the 5 mL serological pipette tip to the serological pipetter"
  bullet: "Pipette 2mL of the M9 solution into the 14 mL test tube"
end

release[pipette[0], M9[0], tip[0]]

take
  amp = 1 "100X 1 mL Ampicillin Aliquot"
  kan = 1 "200X 1 mL Kanamycin Aliquot"
  note: "These are in a box labeled antibotics in the specified fridge"
end

step
  description: "Pipette antibotics"
  bullet: "Pipette 20 microL of Ampicillin into the test tube"
  bullet: "Pipette 10 microL of Kanamycin into the test tube"
  note: "Ensure these are fully thawed before pipetting"
  image: "kan_amp"
end

release[amp[0], kan[0]]

take
  ons = item id
end

step
  description: "Mix the overnight suspension culture into the M9 glucose solution"
  note: "Pipette 13 microL of the overnight suspension culture into the test tube with M9 glucose mixture"
end

produce
  r = 1 "Overnight suspension culture" from ons[0]
  location: "B13.425"
  note: "Label this with your initials and date and write the item ID number on it"
  note: "Store in 37 degree shaker incubator"
end

log
  return: {ons: r[:id]}
end

release[ons[0]]

