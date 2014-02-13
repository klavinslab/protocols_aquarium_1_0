argument
  media: object, "The media to use"
  antibio1: object, "The first antiobiotic to add"
  dilution1: number, "The dilution factor for the first antibiotic, where the ratio of antibiotic:media is 1:x"
  antibio2: object, "The second antiobiotic to add"
  dilution2: number, "The dilution factor for the second antibiotic"
  volume: number, "The desired total volume in mL (<50mL)"
  #can we force the same lengths of array?  oherwise return error.
end


take
 media_tube = 1 "50 mL Falcon Tube"
 antibio1 = 1 antibio1
 antibio2 = 1 antibio2
 media = 1 media
 #media[:id] == media_base
 
 pipette = 1 "Serological Pipette"
 tips = 1 "25 mL Serological Pipette Tips"
end

ab_vol1 = volume/dilution1*1000
ab_vol2 = volume/dilution2*1000
media_name = media[:name]
ab1_name = antibio1[:name]
ab2_name = antibio2[:name]

step
  description: "Prepare %{volume} mL of %{media_name} media with the desired antibiotics"
  check: "Attach the 25mL tip to the serological pipetter"
  check: "Use the electric serological pipette to add  %{volume} mL of %{media_name} into the 50mL falcon tube"
  check: "Dispose of your 25mL serological pipette tip in tip waste"
  check: "Pipette %{ab_vol1} uL of %{ab1_name} to the solution"
  check: "Pipette %{ab_vol2} uL of %{ab2_name} to the solution"
  check: "Vortex the solution for 15 seconds"
end

produce
  m = 1 "Prepared Media" from media_tube
  location: "Bench"
end

release concat(media,antibios)

log
  return: {prepared_media: m}
end
