#By David Starkebaum and Erik Josberger, 2014/02/13

take
 media_tube = 2 "50 mL Falcon Tube"
 media = 1 "400 mL M9 liquid Glucose"
 pipette = 1 "Serological Pipette"
 tip = 1 "25 mL Serological Pipette Tips"
 amp = 1 "100X 1 mL Ampicillin Aliquot"
 kan = 1 "200X 1 mL Kanamycin Aliquot"
end

step
  description: "Information about the serological pipetter"
  note: "Note that the pipette tip has two sets of numbers:"
  bullet: "The larger set of numbers on the pipette tip count down from 25mL ('0mL' is full, '25ml' is empty)"
  bullet: "The smaller numbers count up from 0 ('0mL' is empty, '25ml' is full)"
  bullet: "Use whichever scale is convenient for you, but just be aware which you are using"
  note: "The pipetter has two 'triggers'"
  bullet: "The top trigger pulls liquid into the pipette tip"
  bullet: "The bottom trigger ejects liquid out"
  bullet: "The harder you press the trigger, the faster the pump goes"
end

step
  description: "Add 'M9 liquid Glucose' to the 50mL falcon tubes"
  check: "Attach the 25mL tip to the serological pipetter"
  check: "Use the electric serological pipette to add 15 mL of 'M9 liquid Glucose' into a 50mL falcon tube"
  check: "Add another 15 mL of 'M9 liquid Glucose' into the 50mL falcon tube"
  check: "Add 15mL of 'M9 liquid Glucose' into the second 50mL falcon tube"
  check: "Add another 15mL 'M9 liquid Glucose' to the second 50mL falcon tube"
  check: "Dispose of your 25mL serological pipette tip in tip waste"
end


step
  description: "Add antibiotics to the 50mL falcon tubes"
  check: "Pipette 60 uL from your '100X 1 mL Ampicillin Aliquot' to the first 50mL falcon tube"
  check: "Pipette 60 uL from your '100X 1 mL Ampicillin Aliquot' to the second 50mL falcon tube"
  check: "Pipette 150 uL from your '200X 1 mL Kanamycin Aliquot' to the first 50mL falcon tube"
  check: "Pipette 150 uL from your '200X 1 mL Kanamycin Aliquot' to the second 50mL falcon tube"
end

step
  description: "Vortex the solutions"
  check: "Vortex the first 50mL Falcon for 15 seconds"
  check: "Vortex the second 50mL Falcon for 15 seconds"
end

release concat(media, concat(pipette, concat(amp, kan)))

produce
  m = 2 "30 mL M9 liquid Glucose + amp + kan"
  location: "Bench"
end

log
 return {prepared_media: m[:id]}
end
