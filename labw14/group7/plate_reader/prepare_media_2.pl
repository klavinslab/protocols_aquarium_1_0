argument
  media_in: object, "The media to use"
  antibio1_in: object, "The first antiobiotic to add"
  dilution1_in: number, "The dilution factor for the first antibiotic, where the ratio of antibiotic:media is 1:x"
  antibio2_in: object, "The second antiobiotic to add"
  dilution2_in: number, "The dilution factor for the second antibiotic"
  volume: number, "The desired total volume in mL (<50mL)"
  #can we force the same lengths of array?  oherwise return error.
end

media_name = media_in
ab1_name = antibio1_in
ab2_name = antibio2_in

take
 media_tube = 1 "50 mL Falcon Tube"
 antibio1 = 1 antibio1_in
 antibio2 = 1 antibio2_in
 media = 1 media_in
 #media[:id] == media_base
 
 pipette = 1 "Serological Pipette"
 tips = 1 "25 mL Serological Pipette Tips"
end

ab_vol1 = volume/dilution1*1000
ab_vol2 = volume/dilution2*1000


step
  description: "Prepare %{volume} mL of %{media_in} media with the desired antibiotics"
  check: "Attach the 25mL tip to the serological pipetter"
  check: "Use the electric serological pipette to add  %{volume} mL of %{media_name} into the 50mL falcon tube"
  check: "Dispose of your 25mL serological pipette tip in tip waste"
  check: "Pipette %{ab_vol1} uL of %{ab1_name} to the solution"
  check: "Pipette %{ab_vol2} uL of %{ab2_name} to the solution"
  check: "Vortex the solution for 15 seconds"
end

produce
  m = 1 "Prepared Media" from media_tube[0]
  location: "Bench"
end

release concat(media,antibios)

log
  return: {prepared_media: m}
end
