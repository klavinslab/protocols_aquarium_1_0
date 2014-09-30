information "Load digested parts and run an agarose gel."

argument
  fragment_names: sample array, "Fragment Names"
  fragment_volumes: number array, "The volume of each fragment to load."
  control_names: sample array, "Names of control samples"
  control_volumes: number array, "Volumes of each control to load, uL"
  ladder_one: sample
  voltage: number, "Voltage of gel run, number. Example: 140 = 140 Volts"
  time_to_run: number, "Time of gel run in minutes."
  percent: number, "Gel persentage to use, 1 = 1%."
  well_volume: number, "Total volume of compounds to be loaded, uL"
  fragment_volume: number, "The volume of PCR fragment to load in µL."
end

number_of_samples = length(fragment_names)
wells_per_gel = 10
number_of_gels = ((number_of_samples - 1) / wells_per_gel) + 1

dye_volume = well_volume / 5.0



#a=length(fragment_names)-1
#b=a/10
#c=b+1

take
  gel = number_of_gels "50 mL %{percent} Percent Agarose Gel in Gel Box"
  fragment = item fragment_names
  control = item control_names
  ladder = item ladder_one
  loading_dye = 1 "Gel Loading Dye Blue (6X)"
end


step
  description: "Set up the power supply."
  note: "In the gel room, obtain a power supply and set it to %{voltage} V. Set timer to %{time_to_run} minutes.\n\nAttach the electrodes of an appropriate gel box lid from A7.525 to the power supply."
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

#num = length(fragment_names)
#dye_volume = fragment_volume / 5.0

# Prepare control samples
counter = 0
while counter < length(control_names)
  current_ctrl = control_names[counter]
  one_ctrl_vol = control_volumes[counter]
  buffer_volume = well_volume - one_ctrl_vol - dye_volume
  
  step
    description: "Prepare control samples"
    note: "Those samples are to help identify the success of main reaction. \nFor example, if one did restriction digestion reaction, a control will be non-digested sample. \nThis band usually not necessary to cut, it is informational only."
    check: "Take 0.3 mL PCR tube, label it as C%{counter}."
    check: "To PCR tube, add %{buffer_volume} uL of 1X TAE buffer."
    check: "Take %{one_ctrl_vol} uL of sample %{current_ctrl} and add to PCR tube."
    check: "Take %{dye_volume} of gel loading dye and add to PCR tube."
    check: "Vortex PCR tube."
  end
  
  counter = counter + 1
end


# Prepare purification samples
step
  description: "Add loading dye to each of the the %{number_of_samples} analyzed samples"
  note: "Add %{dye_volume} µL of loading dye to the analyzed samples."
  image: "gel_add_loading_dye"
end

release loading_dye

step
  description: "Load the ladder"
  note: "Using a 100 µL pipetter, pipet 10 µL of ladder (containing loading dye) with id %{ladder_one} into well 1 (top-left)."
  image: "gel_begin_loading"
end
if length(fragment_names) > 5
  step
    description: "Load the ladder"
    note: "Using a 100 µL pipetter, pipet 10 µL of ladder (containing loading dye) with id %{ladder_one} into  well 7 (bottom-left)."
    image: "gel_begin_loading"
  end
end
if length(fragment_names) > 10
  step
    description: "Load the ladder in gel box 2"
    note: "Using a 100 µL pipetter, pipet 10 µL of ladder (containing loading dye) with id %{ladder_one} into well 14 (Gel 2: top-second to left)."
    warning: "Note that the ladder should be loaded in the second column to denote that this is gel 2"
    image: "gel_begin_loading"
  end
end
if length(fragment_names) > 15
  step
    description: "Load the ladder in gel box 2"
    note: "Using a 100 µL pipetter, pipet 10 µL of ladder (containing loading dye) with id %{ladder_one} into well 20 (Gel 2: bottom-second to left)."
    warning: "Note that the ladder should be loaded in the second column to denote that this is gel 2"
    image: "gel_begin_loading"
  end
end
if length(fragment_names) > 20
  step
    description: "Load the ladder in gel box 3"
    note: "Using a 100 µL pipetter, pipet 10 µL of ladder (containing loading dye) with id %{ladder_one} into well 27 (Gel 3: top-third to left)."
    warning: "Note that the ladder should be loaded in the third column to denote that this is gel 3"
    image: "gel_begin_loading"
  end
end
if length(fragment_names) > 25
  step
    description: "Load the ladder in gel box 3"
    note: "Using a 100 µL pipetter, pipet 10 µL of ladder (containing loading dye) with id %{ladder_one} into well 33 (Gel 3: bottom-third to left)."
    warning: "Note that the ladder should be loaded in the third column to denote that this is gel 3"
    image: "gel_begin_loading"
  end
end
if length(fragment_names) > 20
  step
    description: "Load the ladder in gel box 4"
    note: "Using a 100 µL pipetter, pipet 10 µL of ladder (containing loading dye) with id %{ladder_one} into well 40 (Gel 3: top-fourth to left)."
    warning: "Note that the ladder should be loaded in the fourth column to denote that this is gel 4"
    image: "gel_begin_loading"
  end
end
if length(fragment_names) > 25
  step
    description: "Load the ladder in gel box 4"
    note: "Using a 100 µL pipetter, pipet 10 µL of ladder (containing loading dye) with id %{ladder_one} into well 46 (Gel 3: bottom-fourth to left)."
    warning: "Note that the ladder should be loaded in the fourth column to denote that this is gel 4"
    image: "gel_begin_loading"
  end
end

step
  description: "Using a 100 µL pipetter, pipet %{fragment_volume} µL of the first five samples with loading dye into the gel."
  note: "You should have a strip-well tube with the left-most well labeled with an 'A'. This well with the 'A' on it contains the first sample, the well to its right contains the second sample, etc. If you have less than 5 samples, follow this step until you run out of samples, then just check the remaining boxes and hit next."
  note: "After you run out of purification samples, start adding control samples, labelled with 'S<number>'. "
  check: "pipet %{fragment_volume} µL from well 1 into lane 2 (the second lane of the TOP of the first gel). Lane 1 is skipped, because it has ladder in it."
  check: "pipet %{fragment_volume} µL from well 2 into lane 3"
  check: "pipet %{fragment_volume} µL from well 3 into lane 4"
  check: "pipet %{fragment_volume} µL from well 4 into lane 5"
  check: "pipet %{fragment_volume} µL from well 5 into lane 6. This should fill the final well in the top of the gel"
  image: "gel_begin_loading"
end
if length(fragment_names) > 5
  step
    description: "Using a 100 µL pipetter, pipet %{fragment_volume} µL of the next five PCR results with loading dye into the gel."
    note: "You should still have samples left in the strip-well tube with an 'A' on the left most well. If you have less than 10 samples, follow this step until you run out of samples, then just check the remaining boxes and hit next."
    note: "After you run out of purification samples, start adding control samples, labelled with 'S<number>'. "
    check: "pipet %{fragment_volume} µL from well 6 into lane 8 (the second lane of the BOTTOM of the first gel). Lane 7 is skipped, because it has ladder in it."
    check: "pipet %{fragment_volume} µL from well 7 into lane 9"
    check: "pipet %{fragment_volume} µL from well 8 into lane 10"
    check: "pipet %{fragment_volume} µL from well 9 into lane 11"
    check: "pipet %{fragment_volume} µL from well 10 into lane 12. This should fill the final well in this gel"
    image: "gel_begin_loading"
  end
end
if length(fragment_names) > 10
  step
    description: "Using a 100 µL pipetter, pipet %{fragment_volume} µL of the next five PCR results with loading dye into the second gel."
    note: "You should still have samples left in the strip-well tube with an 'A' on the left most well. You may also have samples in a strip-well tube labeled 'B'. The well with the 'B' on it contains sample 13, the one to its right 14, ... If you have less than 15 samples, follow this step until you run out of samples, then just check the remaining boxes and hit next."
    note: "After you run out of purification samples, start adding control samples, labelled with 'S<number>'. "
    check: "pipet %{fragment_volume} µL from well 11 into lane 13 (the first lane of the TOP of the second gel)"
    check: "pipet %{fragment_volume} µL from well 12 into lane 15 (the third lane of the TOP of the second gel). Lane 14 is skipped, because it has ladder in it"
    check: "pipet %{fragment_volume} µL from well 13 (now using the 'B' strip-well tube) into lane 16"
    check: "pipet %{fragment_volume} µL from well 14 into lane 17"
    check: "pipet %{fragment_volume} µL from well 15 into lane 18. This should fill the final well in the top of gel 2"
    image: "gel_begin_loading"
  end
end
if length(fragment_names) > 15
  step
    description: "Using a 100 µL pipetter, pipet %{fragment_volume} µL of the next five PCR results with loading dye into the second gel."
    note: "At this point, you should get how this works... If you have less than 20 samples, follow this step until you run out of samples, then just check the remaining boxes and hit next."
    note: "After you run out of purification samples, start adding control samples, labelled with 'S<number>'. "
    check: "pipet %{fragment_volume} µL from well 16 into lane 19"
    check: "pipet %{fragment_volume} µL from well 17 into lane 21"
    check: "pipet %{fragment_volume} µL from well 18 into lane 22"
    check: "pipet %{fragment_volume} µL from well 19 into lane 23"
    check: "pipet %{fragment_volume} µL from well 20 into lane 24"
    image: "gel_begin_loading"
  end
end
if length(fragment_names) > 20
  step
    description: "Using a 100 µL pipetter, pipet %{fragment_volume} µL of the next five PCR results with loading dye into the third gel."
    note: "If you have less than 25 samples, follow this step until you run out of samples, then just check the remaining boxes and hit next."
    note: "After you run out of purification samples, start adding control samples, labelled with 'S<number>'. "
    check: "pipet %{fragment_volume} µL from well 21 into lane 25"
    check: "pipet %{fragment_volume} µL from well 22 into lane 26"
    check: "pipet %{fragment_volume} µL from well 23 into lane 28"
    check: "pipet %{fragment_volume} µL from well 24 into lane 29"
    check: "pipet %{fragment_volume} µL from well 25 into lane 30"
    image: "gel_begin_loading"
  end
end
if length(fragment_names) > 25
  step
    description: "Using a 100 µL pipetter, pipet %{fragment_volume} µL of the next five PCR results with loading dye into the third gel."
    note: "If you have less than 30 samples, follow this step until you run out of samples, then just check the remaining boxes and hit next."
    note: "After you run out of purification samples, start adding control samples, labelled with 'S<number>'. "
    check: "pipet %{fragment_volume} µL from well 26 into lane 31"
    check: "pipet %{fragment_volume} µL from well 27 into lane 32"
    check: "pipet %{fragment_volume} µL from well 28 into lane 34"
    check: "pipet %{fragment_volume} µL from well 29 into lane 35"
    check: "pipet %{fragment_volume} µL from well 30 into lane 36"
    image: "gel_begin_loading"
  end
end
if length(fragment_names) > 30
  step
    description: "Using a 100 µL pipetter, pipet %{fragment_volume} µL of the next five PCR results with loading dye into the fourth gel."
    note: "After you run out of purification samples, start adding control samples, labelled with 'S<number>'. "
    note: "If you have less than 35 samples, follow this step until you run out of samples, then just check the remaining boxes and hit next."
    check: "pipet %{fragment_volume} µL from well 31 into lane 37"
    check: "pipet %{fragment_volume} µL from well 32 into lane 38"
    check: "pipet %{fragment_volume} µL from well 33 into lane 39"
    check: "pipet %{fragment_volume} µL from well 34 into lane 41"
    check: "pipet %{fragment_volume} µL from well 35 into lane 42"
    image: "gel_begin_loading"
  end
end
if length(fragment_names) > 35
  step
    description: "Using a 100 µL pipetter, pipet %{fragment_volume} µL of the next five PCR results with loading dye into the fourth gel."
    note: "If you have less than 40 samples, follow this step until you run out of samples, then just check the remaining boxes and hit next."
    note: "After you run out of purification samples, start adding control samples, labelled with 'S<number>'. "
    check: "pipet %{fragment_volume} µL from well 36 into lane 43"
    check: "pipet %{fragment_volume} µL from well 37 into lane 44"
    check: "pipet %{fragment_volume} µL from well 38 into lane 45"
    check: "pipet %{fragment_volume} µL from well 39 into lane 47"
    check: "pipet %{fragment_volume} µL from well 40 into lane 48"
    image: "gel_begin_loading"
  end
end

step
  description: "Start electrophoresis"
  note: "Carefully attach the gel box lid(s) to the gel box(s), being careful not to bump the samples out of the wells. Attach the red electrode to the red terminal of the power supply, and the black electrode to the neighboring black terminal. Hit the start button on the gel boxes - usually a small running person icon."
  warning: "Make sure the power supply is not erroring (no E* messages) and that there are bubbles emerging from the platinum wires in the bottom corners of the gel box."
  image: "gel_check_for_bubbles"
end


gel_lane_ids=[]
x=0
while x < number_of_samples
  produce
    gel_lane = 1 "Gel Lane" from fragment[x]
  end
  gel_lane_ids = append(gel_lane_ids,gel_lane[:id])
  x=x+1
end

log
  return: {gel_lane_ids: gel_lane_ids}
end

release ladder
release fragment
release gel
release control
end
