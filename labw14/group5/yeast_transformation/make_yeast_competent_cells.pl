argument
  yeast_250ml_flask: sample array, "Diluted yeast culture"
end

num = length(yeast_250ml_flask)

step
  description: "This protocol describes how to make yeast competent cell aliquot"
  warning: "It is possible to make up to 6 aliquots out of one yeast suspension culture flask. 
        You will be asked on your desired number of aliquots later."
end

take
  falcon_tube = num "50 mL Falcon Tube"
  flask = item yeast_250ml_flask
end


step
  description: "Harvest the cells by centrifugation"
  check: "Label 50mL falcon tubes with the id number of the 250mL flasks, so that each tube has
          the same number as one the flasks."
  check: "Transfer 25mL of the diluted yeast culture from each flask to the 50mL falcon tube with the same id number."
end

step
  description: "Centfifuge the tubes"
  check: "Centfifuge all the 50mL tubes with yeast liquid culture for 5 min at 3000 x g
          in the table top centrifuge located at B3.355 (or B1.340???)."
  warning: "Be sure you balanced the centrifuge."
end

step
  description: "Wash the cells"
  check: "Collect all the 50mL tubes from the centrifuge and place them in a tube rack on your bench."
  check: "Pour out the liquid from the tubes into the liquid waste bottle placed on your bench."
  warning: "Be careful. Don't destroy the pellet."
end

step
  description: "Wash the cells. Continue"
  check: "Take %{num} 1.5mL centrifuge tubes. Label them with the id numbers of the 50mL falcon tubes."
  check: "Add 1mL of the molecular grade water into each 50mL falcon tube and resuspend the cells by pipetting
          up and down. Transfer the resuspended cells (~1mL) from the 50mL tubes to the 1.5mL centrifuge tubes
          with the corresponding id numbers."
end

step
  description: "Wash the cells. Continue"
  check: "Centrifuge all the 1.5mL tubes for 1 min in a mini-centrifuge located on your bench."
  check: "Pour out the supernatant."
  check: "Add 1mL of the 100mM LiOAc liquid to each 1.5mL tube and resuspend the cells by vortexing."
  check: "Centrifuge all the 1.5mL tubes for 1 min in a mini-centrifuge located on your bench."
  check: "Pour out the supernatant."
end


ii = 0

vol_data = []

while ii < length(yeast_250ml_flask)

  id_num = yeast_250ml_flask[ii]

  step
    description: "Resuspending the cells in the tube %{id_num}"
    note: "Estimate the approximate volume of the pellet in the tube %{id_num}."
    getdata
      n: number, "Estimated volume of the pellet"
    end
    check: "Add 4 pellet volumes of 100mM LiOAc liquid to the tube and resuspend the cells by vortxing."
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
  max = 4 * vol_val / 50
  max_des = max - 1
  
  step
    description: "Obtaining cell aliquots from a tube %{id_num}"
    note: "You can obtain %{max} cell aliquots from a tube %{id_num}, 50μL each."
    warning: "But one of these aliquots will be used as a control aliquot. So you can plate maximum %{max_des} aliquots."
    getdata
      num_to_make: number, "Number of aliquots you want to plate (max %{max_des}), excluding control one."
    end
  end
  
  jj = 0
  total_number = num_to_make + 1
  numbers = append(numbers,total_number)
  
  while jj < total_number
    if jj == 0
      step
        description:"Control aliquot from the tube %{id_num}"
        note: "Take a 1.5mL tube and write your name on its side. Write CONTROL word on its side as well."
        check: "Pipette 50μL of aliquot from a tube %{id_num} into the CONTROL 1.5mL tube."
      end
    
      produce
          y = 1 "Yeast Competent Aliquot" from flask[ii]
          note: "Write the above id number on the aliquot tube's cap. Place the tube in a tube holder on the bench."
          location:"Bench"      
      end
    else
      step
        description:"Aliquots from the tube %{id_num}"
        note: "Take a 1.5mL tube and write your name on its side."
        check: "Pipette 50μL of aliquot from a tube %{id_num} into the new 1.5mL tube."
      end
    
      produce
          y = 1 "Yeast Competent Aliquot" from flask[ii]
          note: "Write the above id number on the aliquot tube's cap. Place the tube in a tube holder on the bench."
          location:"Bench"      
      end
    end
  
    r = append(r,y[:id])
    jj = jj + 1
  end
  
  ii=ii+1
end

log
  return: { yeast_aliquot: r, numbers_set: numbers }
end

release falcon_tube
release flask
