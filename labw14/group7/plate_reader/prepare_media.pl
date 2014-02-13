argument
  media: sample("liquidmedia"), "The media to use"
  antibios: sample("liquidchem") array, "The antiobiotics to add"
  dilution: number array, "An array of dilution factors for each antibiotic, where the ratio of antibiotic:media is 1:x"
  volume: number, "The desired total volume in mL (<50mL)"
  #can we force the same lengths of array?  oherwise return error.
end

take
 media_tube = 1 "50 mL Falcon Tube"
 antibios = item array antibios  #check this!
 media = item media
 #media[:id] == media_base
 
 pipette = 1 "Serological Pipette"
 tips = 1 "25 mL Serological Pipette Tips"
end

i=0
antibio_volume = []
for i<length(antibios)
  antibio_volume[i] = total_volume/dilution[i]*1000
end

step
  description: "Prepare %{volume} mL of %{media[:name]} media with the desired antibiotics"
  check: "Attach the 25mL tip to the serological pipetter"
  check: "Use the electric serological pipette to add  %{volume} mL of %{media[:name]} into the 50mL falcon tube"
  check: "Dispose of your 25mL serological pipette tip in tip waste"
end

i=0
for i<length(antibios)
  step
    description: "Add the %{antibios[i][:name]} to the solution"
    check: "Pipette %{antibio_volume[i]} uL of %{antibios[i][:name]} to the solution"
  end
end

step
  description: "Vortex the solution"
  check: "Press the 50mL Falcon tube to the vortexer for 15 seconds"
end

produce
  m = 1 "Prepared Media" from media_tube
  location: "Bench"
end

release concat(media,antibios)

log
  return: {prepared_media: m}
end
