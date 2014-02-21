information "Load and run an agarose gel."


argument
  assemblies1: sample, " Select the first PCR Results."
  assemblies2: sample, " Select the second PCR Results."
  ladder_one: sample
  fragment_volume: number, "The volume of PCR fragment to load in µL."
end


take
  glasses = 1 "Clear Protective Glasses"
end


step
  description: "Wear clear protective glasses"
end


take
  gel = 1 "50 mL 1 Percent Agarose Gel in Gel Box"
  fragment1 = item assemblies1
  fragment2 = item assemblies2
  ladder = item ladder_one
  loading_dye = 1 "Gel Loading Dye Blue (6X)"
end


step
  description: "Set up the power supply."
  note: "In the gel room, obtain a power supply and set it to 100 V and with a 40 minute timer.\n\nAttach the electrodes of an appropriate gel box lid from A7.525 to the power supply."
  image: "gel_power_settings"
end


step
  description: "Set up the gel box."
  check: "Carefully remove the casting tray (with gel) and place it on the bench."
  check: "Using the graduated cylinder at A5.305, fill the gel box with 200 mL of 1X TAE from J2 at A5.500. TAE should just cover the center of the gel box."
  check: "With the gel box electrodes facing away from you, place the casting tray (with gel) back in the gel box. The top lane should be on your left, as the DNA will move to the right."
  check: "Using the graduated cylinder, add 50 mL of 1X TAE from J2 at A5.500 so that the surface of the gel is covered."
  check: "Carefully remove the comb(s) and place them in the appropriate box in A7.325."
  check: "Put the graduated cylinder back at A5.305."
  image: "gel_fill_TAE_to_line"
end


dye_volume = fragment_volume / 5.0
step
  description: "Add loading dye to the PCR fragment"
  note: "Using a 10 µL or 100 µL pipetter, add %{dye_volume} µL of loading dye to the PCR results with id %{assemblies1}."
  note: "Using a 10 µL or 100 µL pipetter, add %{dye_volume} µL of loading dye to the PCR results with id %{assemblies2}."
  image: "gel_add_loading_dye"
end


release loading_dye


step
  description: "Load the ladder"
  note: "Using a 100 µL pipetter, pipet 10 µL of ladder (containing loading dye) with id %{ladder_one} into the first (top-left) well of the gel."
  image: "gel_begin_loading"
end


step
  description: "Load the PCR"
  note: "Using a 100 µL pipetter, pipet %{fragment_volume} µL of PCR results (containing loading dye) with id %{assemblies1} into the second and with id %{assemblies2} into the third well of the gel."
  image: "gel_begin_loading"
end


step
  description: "Start electrophoresis"
  note: "Carefully attach the gel box lid to the gel box, being careful not to bump the samples out of the wells. Attach the red electrode to the red terminal of the power supply, and the black electrode to the neighboring black terminal. Hit the start button on the gel boxes - usually a small running person icon."
  warning: "Make sure the power supply is not erroring (no E* messages) and that there are bubbles emerging from the platinum wires in the bottom corners of the gel box."
  image: "gel_check_for_bubbles"
end


release ladder

release fragment1  # Throw away the tube / save extra
release fragment2
release glasses


produce
  s = 1 "Gel Lanes" of "fLAB1"

end

log
  return: { Gel_Lanes_id: s[:id]}
end

