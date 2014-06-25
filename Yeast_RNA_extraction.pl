# Protocol for Yeast RNA extraction

argument
  strain_id: sample("Yeast Strain") array, "Yeast overnight suspension(s) to be extracted"
end

take
  overnight = item strain_id
  a = 1 "TES Buffer"
  b = 1 "Acid Phenol"
  c = 1 "Chloroform"
  d = 1 "Sodium Acetate Trihydrate"
  e = 1 "100%% Ethanol"
  f = 1 "80%% Ethanol"
end

step
  description: "Collect desired volume of cells (usually 10-20 mL of OD 0.7-1.0) by centrifugation or vacuum filtration. Flash freeze in liquid nitrogen and store at -80C."
end

step
  check: "Resuspend cells in 400 uL TES buffer."
  check: "Transfer to a 1.5 mL tube containing 400 uL acid phenol."
  check: "Vortex 10 seconds and then incubate at 65C for 60 minutes, vortexing a few times during the incubation."
  check: "Place on ice for 5 minutes."
end

step
  check: "Centrifuge at 13 kRPM in microcentrifuge for 10 minutes at 4C or in cold room."
  check: "Transfer aqueous layer to new 1.5 mL tube containing 400 uL acid phenol."
  check: "Vortex briefly and spin again."
end

step
  description: "While samples are in their second spin, prepare phase lock gel (PLG) tubes: spin down PLG tubes so gel is at the bottom."
  check: "Centrifuge at 13 kRPM for 30 seconds at room temperature."
end

step
  description: "Centrifuge at 13 kRPM for 10 minutes in cold room."
  check: "Transfer 200-250 uL to a new 1.5 mL tube."
end

step
  description: "Precipitate RNA with 1/10 volume 3M NaOAc and 3 volumes 100%% EtOH on dry ice for appx. 1 hour or at -20C overnight (keep EtOH cold)."
end

step
  description: "Pellet RNA by centrifuging at 13 kRPM for 15 minutes in cold room. Discard supernatant and wash once in 500 uL 80%% EtOH: 'resuspend' as much as possible with pipetting, then spin 5 minutes at 13 kRPM in cold room centrifuge. Discard supernatant."
end

step
  description: "Air dry pellets by leaving tubes open and inverted on the bench or by speed vac (but make sure they don't get too warm)."
end

step
  description: "Resuspend in 50 uL H2O."
  note: "Pellet might be difficult to resuspend."
end

step
  description: "Measure RNA concentration and quality with a Nanodrop."
  note: "Use a 1:50 dilution to nanodrop."
  note: "Optional: run a denaturing agarose gel to check degradation."
end

count=0
while count < length(strain_id)
  strain = overnight[count]
  produce
    p = 1 "Isolated RNAs" from strain
  end
  count = count + 1
end

release [ a[0], b[0], c[0], d[0], e[0], f[0]]
