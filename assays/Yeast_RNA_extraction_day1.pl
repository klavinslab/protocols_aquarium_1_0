# Protocol for Yeast RNA extraction (Day 1 of process)

argument
  strain_id: sample("Yeast Strain") array, "Yeast sample(s) to be extracted"
end

take
  overnight = item strain_id
  a = 1 "TES Buffer"
  b = 1 "Acid Phenol"
  c = 1 "Chloroform"
  d = 1 "3M NaOAc"
  e = 1 "100%% Ethanol"
end

step
  check: "Collect cells by centrifugation at 3000 RPM for 5 minutes."
  check: "Discard supernatent."
  check: "Flash freeze by storing at -80C."
  note: "Samples can be removed from -80C storage as soon as it is frozen, in order to proceed with extraction."
end

step
  check: "Remove samples from -80C storage."
  check: "Resuspend cells in 400 uL TES buffer."
  check: "Transfer to a 1.5 mL tube containing 400 uL acid phenol."
  check: "Vortex 10 seconds and then incubate at 65C for 60 minutes, vortexing a few times during the incubation."
  note: "While samples are in their second spin, prepare phase lock gel (PLG) tubes: spin down PLG tubes so gel is at the bottom."
  check: "Centrifuge PLG tubes at 13 kRPM for 30 seconds."
  check: "Once incubation is complete, place samples on ice for 5 minutes."
end

step
  check: "Centrifuge at 13 kRPM in microcentrifuge for 10 minutes at 4C or in cold room."
  check: "Transfer aqueous layer to new 1.5 mL tube containing 400 uL acid phenol."
  check: "Vortex briefly and spin again."
end

step
  check: "Transfer 350uL of aqueous layer of samples to the PLG tubes."
  check: "Add 350uL chloroform."
  note: "Mix by inverting; do not vortex!"
end

step
  note: "Centrifuge at 13 kRPM for 10 minutes in cold room."
  check: "Transfer 200-300uL top aqueous layer to a new 1.5 mL tube."
end

step
  note: "Precipitate RNA with 1/10 volume 3M NaOAc and 3 volumes 100%% EtOH on dry ice for appx. 1 hour or at -20C overnight (keep EtOH cold)."
end

count=0
while count < length(strain_id)
  strain = overnight[count]
  produce
    p = 1 "Precipitated Yeast RNA" from strain
  end
  count = count + 1
end

release [ a[0], b[0], c[0], d[0], e[0]]

step
  description: "Proceed to Day 2 protocol"
end
