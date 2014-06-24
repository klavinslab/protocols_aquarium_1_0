# Protocol for Yeast RNA extraction

step
  description: "Collect desired volume of cells (usually 10-20 mL of OD 0.7-1.0) by centrifugation or vacuum filtration."
  description: "Flash freeze in liquid nitrogen and store at -80C."
end

step
  check: "Resuspend cells in 400 uL TES buffer."
  check: "Transfer to a 1.5 mL tube containing 400 uL acid phenol."
  check: "Vortex 10 seconds and then incubate at 65C for 60 minutes, vortexing a few times during the incubation."
  check: "Plae on ice for 5 minutes."
end

step
  check: "Centrifuge at 13 kRPM in microcentrifuge for 10 minutes at 4C or in cold room."
  check: "Transfer aqueous layer to new 1.5 mL tube containing 400 uL acid phenol."
  check: "Vortex briefly and spin again."
end

step
  description: "While samples are in their second spin, prepare phase lock gel (PLG) tubes: centrifuge at 13 kRPM for 30 seconds at room temperature (spin down PLG tubes so gel is at the bottom)"
end

step
  description: "Centrifuge at 13 kRPM for 10 minutes in cold room."
  description: "Transfer 200-250 uL to a new 1.5 mL tube."
end

step
  description: "Precipitate RNA with 1/10 volume 3M NaOAc and 3 volumes 100% EtOH on dry ice for appx. 1 hour or at -20C overnight (keep EtOH cold)."
end

step
  description: "Pellet RNA by centrifuging at 13 kRPM for 15 minutes in cold room."
  description: "Discard supernatant and wash once in 500 uL 80% EtOH: 'resuspend' as much as possible with pipetting, then spin 5 minutes at 13 kRPM in cold room centrifuge. Discard supernatant."
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
  note: "Optional: run a denaturing agarose gel to check degradation."
end

