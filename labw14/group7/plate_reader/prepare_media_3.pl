argument
  media_id: object, "Please selct the glucose media which you would add antibiotics to"
  antibios: string array, "Please choose the antiobiotics you would like to add. Enter 'amp' for '100X 1 mL Ampicillin Aliquot', 'kan' for '200X 1 mL Kanamycin Aliquot', or 'chlor' for '1000X 1 mL Chloramphenicol Aliquot'"
  dilutions: number array, "Please choose the dilution factors for each antibiotic selected above, where the ratio of antibiotic:media is 1:x"
  total_volume: number, "The desired total volume in mL (<50mL)"
  #can we force the same lengths of array? oherwise return error.
end

#if length(antibios) != length(dilutions)
  #make some error and abort
#end

take
 media_tube = 1 "50 mL Falcon Tube"
 media = item media_id
 #media[:id] == media_base
 pipette = 1 "Serological Pipette"
 tips = 1 "25 mL Serological Pipette Tips"
end

i=0
antibio_volumes = []#the volumes of antibiotic solutions in uL
antibio_objects = []#the object references (an array of json tables) of each antibiotic
while i<length(antibios)
  antibio_volumes[i] = total_volume/dilutions[i]*1000
  antibio_abr = antibios[i]
  if antibio_abr == "amp"
    take
      antibio_objects[i] = 1 "100X 1 mL Ampicillin Aliquot"
    end
  elseif antibio_abr == "kan"
    take
      antibio_objects[i] = 1 "200X 1 mL Kanamycin Aliquot"
    end
  elseif antibio_abr == "chlor"
    take
      antibio_objects[i] = 1 "1000X 1 mL Chloramphenicol Aliquot"
    end
  else
    #someone entered the wrong choice
  end
end

media_name=media[:name]
step
  description: "Prepare %{total_volume} mL of media with the desired antibiotics"
  check: "Attach the 25mL tip to the serological pipetter"
  check: "Use the electric serological pipette to add %{total_volume} mL of '%{media_name}' into the 50mL falcon tube"
  check: "Dispose of your 25mL serological pipette tip in tip waste"
end

i=0
while i<length(antibios)
  antibio_abr = antibios[i]
  antibio_name = antibio_objects[i][:name]
  antibio_volume = antibio_volumes[i]
  step
    description: "Add %{antibio_abr} to the solution"
    check: "Pipette %{antibio_volume} uL of '%{antibio_name}' to the 50mL falcon tube"
  end
end

step
  description: "Vortex the solution"
  check: "Press the 50mL Falcon tube to the vortexer for 15 seconds"
end


#produce
#  m = 1 "Prepared Media" from media_tube
#  location: "Bench"
#end

release concat(media, antibio_objects)

#I am not sure what to put in here yet... come back to this later.  It would be great to be able to generate a label bu concatenating the antibio_abr[i] and media strings together
#log
#  return: {prepared_media: m}
#end
