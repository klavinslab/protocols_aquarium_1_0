information "Load and run an agarose gel."

argument
  QPCR_ids: sample("Yeast Strain") array, "QPCRs to run on a gel"
  ladder_one: sample
end

a=length(QPCR_ids)-1
b=a/10
c=b+1

take
  gel = c "50 mL 1 Percent Agarose Gel in Gel Box"
  QPCRs = item QPCR_ids
  ladder = item ladder_one
  loading_dye = 1 "Gel Loading Dye Blue (6X)"
end

step
  description: "Set up the power supply."
  note: "In the gel room, obtain a power supply and set it to 100 V and with a 40 minute timer.\n\nAttach the electrodes of an appropriate gel box lid from A7.525 to the power supply."
  image: "gel_power_settings"
end

step
  description: "Set up the gel box(s)."
  check: "Carefully remove the casting tray(s) (with gel(s)) and place it on the bench."
  check: "Using the graduated cylinder at A5.305, fill the gel box(s) with 200 mL of 1X TAE from J2 at A5.500. TAE should just cover the center of the gel box(s)."
  check: "With the gel box(s) electrodes facing away from you, place the casting tray(s) (with gel(s)) back in the gel box(s). The top lane(s) should be on your left, as the DNA will move to the right."
  check: "Using the graduated cylinder, add 50 mL of 1X TAE from J2 at A5.500 so that the surface of the gel is covered."
  check: "Carefully remove the comb(s) and place them in the appropriate box(s) in A7.325."
  check: "Put the graduated cylinder back at A5.305."
  image: "gel_fill_TAE_to_line"
end

num = length(QPCRs)
dye_volume = 10 / 5.0
step
  description: "Add loading dye to each of the the %{num} PCR fragments"
  note: "Add %{dye_volume} µL of loading dye to the PCR results."
  image: "gel_add_loading_dye"
end

release loading_dye

step
  description: "Load the ladder"
  note: "Using a 100 µL pipetter, pipet 10 µL of ladder (containing loading dye) with id %{ladder_one} into well 1 (top-left)."
  image: "gel_begin_loading"
end

if num > 9
  step
    description: "Load the ladder"
    note: "Using a 100 µL pipetter, pipet 10 µL of ladder (containing loading dye) with id %{ladder_one} into  well 11 (bottom-left)."
    image: "gel_begin_loading"
  end
end

if length(QPCR_ids) > 18
  step
    description: "Load the ladder in gel box 2"
    note: "Using a 100 µL pipetter, pipet 10 µL of ladder (containing loading dye) with id %{ladder_one} into well 21 (Gel 2: top-second to left)."
    warning: "Note that the ladder should be loaded in the second column to denote that this is gel 2"
    image: "gel_begin_loading"
  end
end

if length(QPCR_ids) > 27
  step
    description: "Load the ladder in gel box 2"
    note: "Using a 100 µL pipetter, pipet 10 µL of ladder (containing loading dye) with id %{ladder_one} into well 31 (Gel 2: bottom-second to left)."
    warning: "Note that the ladder should be loaded in the second column to denote that this is gel 2"
    image: "gel_begin_loading"
  end
end
if length(QPCR_ids) > 36
  step
    description: "Load the ladder in gel box 3"
    note: "Using a 100 µL pipetter, pipet 10 µL of ladder (containing loading dye) with id %{ladder_one} into well 41 (Gel 3: top-third to left)."
    warning: "Note that the ladder should be loaded in the third column to denote that this is gel 3"
    image: "gel_begin_loading"
  end
end
if length(QPCR_ids) > 45
  step
    description: "Load the ladder in gel box 3"
    note: "Using a 100 µL pipetter, pipet 10 µL of ladder (containing loading dye) with id %{ladder_one} into well 51 (Gel 3: bottom-third to left)."
    warning: "Note that the ladder should be loaded in the third column to denote that this is gel 3"
    image: "gel_begin_loading"
  end
end
if length(QPCR_ids) > 54
  step
    description: "Load the ladder in gel box 4"
    note: "Using a 100 µL pipetter, pipet 10 µL of ladder (containing loading dye) with id %{ladder_one} into well 61 (Gel 3: top-fourth to left)."
    warning: "Note that the ladder should be loaded in the fourth column to denote that this is gel 4"
    image: "gel_begin_loading"
  end
end
if length(QPCR_ids) > 63
  step
    description: "Load the ladder in gel box 4"
    note: "Using a 100 µL pipetter, pipet 10 µL of ladder (containing loading dye) with id %{ladder_one} into well 71 (Gel 3: bottom-fourth to left)."
    warning: "Note that the ladder should be loaded in the fourth column to denote that this is gel 4"
    image: "gel_begin_loading"
  end
end

counter = 0
while counter<num

  step
    description: "Using a 100 µL pipetter, pipet 10 µL of the first five PCR results with loading dye into the gel."
    note: "You should have a strip-well tube with the left-most well labeled with an 'A'. This well with the 'A' on it contains the first sample, the well to its right contains the second sample, etc. If you have less than 5 samples, follow this step until you run out of samples, then just check the remaining boxes and hit next."
    check: "pipet 10 µL from well %{counter+1} into lane %{counter+2}. Lane %{counter+1} is skipped, because it has ladder in it."
    check: "pipet 10 µL from well %{counter+2} into %{counter+3}"
    check: "pipet 10 µL from well %{counter+3} into %{counter+4}"
    check: "pipet 10 µL from well %{counter+4} into %{counter+5}"
    check: "pipet 10 µL from well %{counter+5} into %{counter+6}"
    check: "pipet 10 µL from well %{counter+6} into %{counter+7}"
    check: "pipet 10 µL from well %{counter+7} into %{counter+8}"
    check: "pipet 10 µL from well %{counter+8 into %{counter+9}"
    check: "pipet 10 µL from well %{counter+9} into %{counter+10}."
   image: "gel_begin_loading"
  end
  counter = counter+9
end 
  
step
  description: "Start electrophoresis"
  note: "Carefully attach the gel box lid(s) to the gel box(s), being careful not to bump the samples out of the wells. Attach the red electrode to the red terminal of the power supply, and the black electrode to the neighboring black terminal. Hit the start button on the gel boxes - usually a small running person icon."
  warning: "Make sure the power supply is not erroring (no E* messages) and that there are bubbles emerging from the platinum wires in the bottom corners of the gel box."
  image: "gel_check_for_bubbles"
end

counter2=0
while counter2 < num
  produce
    QPCR_gel = 1 "QPCR gel" from QPCRs[counter2]
    release QPCRs[counter2]
  end
  counter2=counter2+18
end

release ladder
release gel
end
