argument
  yeast_250ml_flask: sample array, "Diluted yeast culture"
end

num = length(yeast_250ml_flask)

step
  description: "This protocol describes how to make yeast competent cell aliquots"
  note: "You will make  2  aliquots from the yeast overnight suspension culture. 
          One of these aliquots will be used as a control aliquot."
#  warning: "It is possible to make up to 6 aliquots out of one yeast suspension culture flask. 
#        You will be asked on your desired number of aliquots later."
end

take
  falcon_tube = num "50 mL Falcon Tube"
  lioac_tube  = 1 "100 mM LiOAc"
  flask = item yeast_250ml_flask
end

#   IF   STATEMENT

if num == 1
  step
    description: "Harvesting the cells by centrifugation"
    check: "Label a 50 mL falcon tube with the id number of the 250mL flask."
    check: "Pour 25 mL of the diluted yeast culture from the flask to the labeled 50mL falcon tube."
    image: "Pour_diluted_yeast_culture"
  end

  step
    description: "Centfifuging the tube"
    check: "Centfifuge the labeled 50mL tube with a yeast liquid culture for 5 min at 3000 x g
            in the table top centrifuge located at B14.335."
    warning: "Be sure you balanced the centrifuge. To balance the labeled tube you have to take
              another 50 mL falcon tube and fill it with 25 mL of water."
    image: "Centfifuge_a_yeast_liquid_culture_group5"
  end

  step
    description: "Washing the cells"
    check: "Collect the labeled 50 mL tube from the centrifuge and place it in a tube rack on your bench."
    check: "Pour out the liquid from the tube into the sink at the washing station, location: A8.310."
    warning: "Be careful. Don't destroy the pellet."
    image: "cell_pellet_group5"
  end

  step
    description: "Washing the cells. Continuation"
    check: "Take a 1.5 mL tube. Label it with the id number of the labeled 50mL falcon tube."
    check: "Add 1 mL of molecular grade water into the labeled 50 mL falcon tube and resuspend the cells by vortexing.
            Transfer the resuspended cells (~1mL) from the 50 mL tube to the labeled 1.5 mL tube."
    image: "50 mL_falcon tube_and_resuspend_the _cells_by_vortexing"
  end

  step
    description: "Washing the cells. Continuation"
    check: "Centrifuge the labeled 1.5mL tube for 1 min in a mini-centrifuge located on your bench."
    check: "Using P1000 pipettor carefully remove the supernatant from the tube. Do not destroy the pellet."
    check: "Add 1 mL of the 100 mM LiOAc liquid to the 1.5 mL tube and resuspend the cells by vortexing."
    check: "Centrifuge the 1.5 mL tube for 1 min in a mini-centrifuge located on your bench."
    check: "Using P1000 pipettor carefully remove the supernatant from the tube. Do not destroy the pellet."
    image: "washing_the_cells_group5"
  end
else
  step
    description: "Harvesting the cells by centrifugation"
    check: "Label 50 mL falcon tubes with the id number of the 250 mL flasks, so that each tube has
            the same number as one the flasks."
    check: "Pour 25 mL of the diluted yeast culture from each flask to the 50 mL falcon tube with the same id number."
  end

  step
    description: "Centfifuging the tubes"
    check: "Centfifuge all the 50 mL tubes with a yeast liquid culture for 5 min at 3000 x g
            in the table top centrifuge located at B14.335."
    warning: "Be sure you balanced the centrifuge."
    image: "Centfifuge_a_yeast_liquid_culture_group5"
  end

  step
    description: "Washing the cells"
    check: "Collect all the 50 mL tubes from the centrifuge and place them in a tube rack on your bench."
    check: "Pour out the liquid from the tubes into the sink at the washing station, location: A8.310."
    warning: "Be careful. Don't destroy the pellet."
  end

  step
    description: "Washing the cells. Continuation"
    check: "Take %{num} 1.5 mL tubes. Label them with the id numbers of the 50 mL falcon tubes."
    check: "Add 1 mL of molecular grade water into each 50 mL falcon tube and resuspend the cells by vortexing.
            Transfer the resuspended cells (~1 mL) from the 50 mL tubes to the 1.5 mL tubes
            with the corresponding id numbers."
    image: "50 mL_falcon tube_and_resuspend_the _cells_by_vortexing"
  end

  step
    description: "Washing the cells. Continuation"
    check: "Centrifuge all the 1.5 mL tubes for 1 min in a mini-centrifuge located on your bench."
    check: "Using P1000 pipettor carefully remove the supernatant from each tube. Do not destroy the pellet."
    check: "Add 1 mL of the 100 mM LiOAc liquid to each 1.5 mL tube and resuspend the cells by vortexing."
    check: "Centrifuge all the 1.5 mL tubes for 1 min in a mini-centrifuge located on your bench."
    check: "Using P1000 pipettor carefully remove the supernatant from each tube. Do not destroy the pellet."
    image: "washing_the_cells_group5"
  end
end

#  THE  END   OF  THE   IF   STATEMENT



ii = 0

vol_data = []

while ii < length(yeast_250ml_flask)

  id_num = yeast_250ml_flask[ii]

  step
    description: "Take 1.5 mL tube with id %{id_num}"
    note: "Estimate the approximate volume of the pellet in a tube with id %{id_num} ( in µL )."
    getdata
      n: number, "Estimated volume of the pellet in µL:"
    end
  end
  amount_to_add = 4 * n
  total_vol     = 5 * n
  step
    description: "Resuspending the cells in a tube with id %{id_num}"
    check: "Add %{amount_to_add} µL of 100 mM LiOAc liquid to the tube and resuspend the cells by vortxing."
   end
  vol_data = append(vol_data,n)
  ii = ii + 1
end



step
  description: "Now you will start obtaining cell aliquots"
end



ii = 0
r = []
numbers = []


while ii < length(yeast_250ml_flask)

  id_num = yeast_250ml_flask[ii]
  vol_val = vol_data[ii]
  max = vol_val / 10

  step
    description: "Make cell aliquots from a 1.5 mL tube with id %{id_num}"
    note: "Now you will make 2 aliquots from a tube with id %{id_num}, 50 µL each."
    warning: "Notice that one of these aliquots will be used as a control aliquot."
  end

#  step
#    description: "Obtaining cell aliquots from a 1.5 mL tube with id %{id_num}"
#    note: "You can obtain up to %{max} cell aliquots from a tube %{id_num}, 50µL each."
#    warning: "Note that one of these aliquots will be used as a control aliquot."
#    getdata
#      num_to_make: number, "Number of aliquots you want to plate (max %{max}), INCLUDING the CONTROL aliquot."
#    end
#  end
  
#  if num_to_make == 1
#    step
#      description: "You typed '1' as a number of aliquots you would like to make. 
#                    But you need at least 2 aliquots, because one will be used to transform digested DNA and
#                    the other one to transform CONTROL aliquot. So we think you made a mistake and thefore
#                    we made a correction for you and change the number to 2 aliquots."
#    end
#  else
#    step
#      description: "So you will make %{num_to_make} aliquots from a tube with id %{id_num}"
#    end
#  end
  
  jj = 0
  total_number = 2 #num_to_make
#  numbers = append(numbers,total_number)
  
  while jj < total_number
    if jj == 0
      step
        description:"Making CONTROL aliquot from the tube with id %{id_num}"
        note: "Take a 1.5 mL tube and write your name on its side. Write 'CONTROL' word on its side as well."
        check: "Pipet 50 µL of aliquot from a tube with id %{id_num} into the CONTROL 1.5 mL tube."
      end
    
      produce
          y = 1 "Yeast Competent Aliquot" from flask[ii]
          note: "Write the above id number on the aliquot tube's cap. Place the tube in a tube holder on the bench."
          location:"Bench"      
      end
      r = append(r,y[:id])
    else
      step
        description:"Making another aliquot from the tube with %{id_num}"
        note: "Take a 1.5 mL tube and write your name on its side."
        check: "Pipet 50 µL of aliquot from a tube %{id_num} into the labeled 1.5 mL tube."
      end
    
      produce
          z = 1 "Yeast Competent Aliquot" from flask[ii]
          note: "Write the above id number on the aliquot tube's cap. Place the tube in a tube holder on the bench."
          location:"Bench"      
      end
      r = append(r,z[:id])
    end
  
    #r = append(r,y[:id])
    jj = jj + 1
  end
  
  ii=ii+1
end


log
  #return: { yeast_aliquot: r, numbers_set: numbers }
  return: { yeast_aliquot: r }
end


release falcon_tube
release lioac_tube

if num == 1
  step
    description: "Release the following item:"
    note: "Take the 250 mL flask to the washing station located at A8.310. Add 20%% bleach to the flask
          and leave it beside the sink."
    warning: "When done, click Next. Then choose 'Dispose' option on the next page."
  end
else
  step
    description: "Release the following item:"
    note: "Take all the 250 mL flaskы to the washing station located at A8.310. Add 20%% bleach to the flasks and
          leave them beside the sink."
    warning: "When done, click Next. Then choose 'Dispose' option on the next page."
  end
end

release flask

step
  description: "Important note"
  warning: "The next protocol will fire only if 40 minutes have passed since the completion of the 'PmeI Digest' protocol."
end
