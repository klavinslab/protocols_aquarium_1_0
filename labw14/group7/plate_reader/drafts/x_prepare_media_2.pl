argument
  media_in: object, "The media to use"
  antibio1_in: object, "The first antibiotic to add"
  dilution1_in: number, "The dilution factor for the first antibiotic, where the ratio of antibiotic:media is 1:x"
  antibio2_in: object, "The second antibiotic to add"
  dilution2_in: number, "The dilution factor for the second antibiotic"
  volume: number, "The desired total volume in mL (<50mL)"
  label: string, "A label to put on this media"
  #can we force the same lengths of array?  oherwise return error.
end

take
 media_tube = 1 "50 mL Falcon Tube"
 antibio1 = 1 antibio1_in
 antibio2 = 1 antibio2_in
 media = 1 media_in
 #media[:id] == media_base
 
 pipette = 1 "Serological Pipette"
 tips = 1 "25 mL Serological Pipette Tips"
end

ab_vol1 = volume*1000/dilution1_in
ab_vol2 = volume*1000/dilution2_in  #check for digits!


step
  description: "Prepare %{volume} mL of %{media_in} media with the desired antibiotics"
  check: "Write %{label} on the 50mL tube"
  check: "Attach the 25mL tip to the serological pipetter"
  check: "Use the electric serological pipette to add  %{volume} mL of %{media_in} into the 50mL falcon tube"
  check: "Dispose of your 25mL serological pipette tip in tip waste"
  check: "Pipette %{ab_vol1} uL of %{antibio1_in} to the solution"
  check: "Pipette %{ab_vol2} uL of %{antibio2_in} to the solution"
  check: "Vortex the solution for 15 seconds"
  check: "Keep this tube at your bench for the next protocol"
end

release concat(media,concat(antibio1,concat(antibio2,pipette)))

log
  return: {media_label: label}
end
