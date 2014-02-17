#By David Starkebaum and Erik Josberger, 2014/02/13
argument
  media_name: object, "Please selct the glucose media which you would add antibiotics to"
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
 media = 1 media_name
 #media[:id] == media_base
 pipette = 1 "Serological Pipette"
 tip = 1 "25 mL Serological Pipette Tips"
end

#media_name == media[0][:name]
step
  description: "Add media to the falcon tube"
  check: "Attach the 25mL tip to the serological pipetter"
  check: "Use the electric serological pipette to add %{total_volume} mL of '%{media_name}' into the 50mL falcon tube"
  check: "Dispose of your 25mL serological pipette tip in tip waste"
end

release concat(media, pipette)

i=0
antibio_volumes = []#the volumes of antibiotic solutions in uL
antibio_objects = []#the object references (an array of json tables) of each antibiotic
while i<length(antibios)
  v = total_volume*1000/dilutions[i]
  antibio_volumes = append(antibio_volumes, v)
  antibio_abr = antibios[i]
  antibio_name = ""
  if antibio_abr == "amp"
    antibio_name = "100X 1 mL Ampicillin Aliquot"
    take
      a = 1 antibio_name
    end
  end #I wanted to use elseif here but I got a parsing error: "Expected '=' at 'antibio_abr'"
  if antibio_abr == "kan"
    antibio_name = "200X 1 mL Kanamycin Aliquot"
    take
      a = 1 antibio_name
    end
  end
  if antibio_abr == "chlor"
    antibio_name = "1000X 1 mL Chloramphenicol Aliquot"
    take
      a = 1 antibio_name
    end
  #else #I cannot use the else here, because all of the elseifs did not work. As is, this would only give an error if it was not 'chlor'
    #someone entered the wrong choice
  end
  
  step
    description: "Add %{antibio_abr} to the solution"
    check: "Pipette %{v} uL of '%{antibio_name}' to the 50mL falcon tube"
  end
  
  antibio_objects = append(antibio_objects, a)
  i=i+1
end

step
  description: "Vortex the solution"
  check: "Press the 50mL Falcon tube to the vortexer for 15 seconds"
end

#for some reason this release is giving me a bug...
#release antibio_objects


#produce
# m = 1 "Prepared Media" from media_tube
# location: "Bench"
#end


#I am not sure what to put in here yet... come back to this later. It would be great to be able to generate a label bu concatenating the antibio_abr[i] and media strings together
#log
# return: {prepared_media: m}
#end
