# Protocol for Yeast RNA extraction (Day 2 of process)

argument
  strain_id: sample("Yeast Strain") array, "Precipitated yeast RNAs to be extracted"
end

take
  overnight = item strain_id
  f = 1 "80%% Ethanol"
end

step
  check: "Pellet RNA by centrifuging at 13 kRPM for 15 minutes in cold room."
  check: "Discard supernatant and wash once in 500 uL 80%% EtOH: 'resuspend' as much as possible with pipetting."
  check: "Spin 5 minutes at 13 kRPM in cold room centrifuge."
  check: "Discard supernatant."
end

step
  check: "Air dry pellets by leaving tubes open and inverted on the bench or by speed vac."
  warning: "Make sure the pellets don't get too warm."
end

step
  check: "Resuspend in 50 uL H2O."
  note: "Pellet might be difficult to resuspend."
end

step
  check: "Measure RNA concentration and quality with a Nanodrop."
  note: "Use a 1:50 dilution to nanodrop."
  note: "Optional: run a denaturing agarose gel to check degradation."
end

count=0
while count < length(strain_id)
  strain = overnight[count]
  produce
    p = 1 "Isolated RNA" from strain
  end
  count = count + 1
end

release [ f[0]]
