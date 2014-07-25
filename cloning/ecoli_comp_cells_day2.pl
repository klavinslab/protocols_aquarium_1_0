information "Make DH5alpha e.coli electrocompetent cells!"

argument
  e_coli_id: sample array, "The 2 250 mL cultures of E coli that were innoculated yesterday."
end

take
  LB = 1 "800 mL LB Liquid: For Electrocompetent Cells Only (sterile)"
  water = 1 "800 mL DI Water: For Competent Cells Only (sterile)"
  glycerol = 1 "500 mL 10 Percent Glycerol: For Electrocompetent Cells Only (sterile)"
  gyt = 1 "400 mL GYT"
  overnight = item e_coli_id
  flask = 1 "2000 mL Flask"
  centrifuge_tubes = 4 "225 mL Centrifuge Tube"
end

step
  description: "Set up the E coli growth vessel"
  check: "Pour 800mL of LB into the large 2000 mL flask"
  check: "Pour in contents of both of the 250mL cultured of E. coli"
  check: "Put this flask in the 37 degree shaking incubator"
end

step
  description: "Set everything up while you wait"
  check: "Fill an ice bucket"
  check: "Put 4 225mL centrifuge tubes on the ice"
  check: "Put a bottle with 800 mL of sterile water on the ice"
  check: "Put a bottle with 420 mL of sterile 10%% glycerol on ice"
  check: "Put a bottle of sterile GYT on ice"
  check: "Set the large centrifuge to 4 degrees C and close the lid"
  timer:{ hours: 0, minutes: 0, seconds: 10 }
end

step
  description: "Use the nanodrop to measure the E.coli concentration"
  getdata
    x: number, "Enter the OD"
  end
end

step
  description: "Put the flask on ice for 15-30 minutes, swirling occasionally, until it is thoroughly cold"
end

step
  description: "Pellet the cells"
  check: "Transfer 200mL of LB culture into each of 4 ice-cold 225 mL centrifuge tubes"
  check: "Spin at 2500 rmp for 15 minutes at 4 degrees C"
end

release overnight

step
  description: "Wash the cells with water"
  warning: "Keep the cells on ice at all times!"
  check: "Decant the supernatant of each of the 225 mL centrifuge tubes"
  check: "Add 200 mL of ice-cold water to each of the 225 mL centrifuge tubes"
  check: "Resuspend by vortexing"
  check: "Spin at 2500 rmp for 20 minutes at 4 degrees C"
end

step
  description: "Wash the cells with 10%% glycerol"
  warning: "Keep the cells on ice at all times!"
  check: "Decant the supernatant of each of the 225 mL centrifuge tubes"
  check: "Add 100 mL of ice-cold 10%% glycerol to each of the 225 mL centrifuge tubes"
  check: "Resuspend by vortexing"
  check: "Combine the tubes so that you have 2 225 mL centrifge tubes with 200 mL each"
  check: "Spin at 2500 rmp for 20 minutes at 4 degrees C"
end

step
  description: "Wash the cells a final time with 10%% glycerol"
  warning: "Keep the cells on ice at all times!"
  check: "Decant the supernatant of both of the 225 mL centrifuge tubes"
  check: "Add 8 mL of ice-cold 10%% glycerol to both of the 225 mL centrifuge tubes"
  check: "Resuspend by vortexing"
  check: "Combine the tubes so that you have 1 225 mL centrifge tube with 16 mL"
  check: "Spin at 2500 rmp for 20 minutes at 4 degrees C"
  warning: "Remember to balance the cntrifuge!"
end

step
  description: "Prepare tubes for aliquoting"
  check: "Take out both aluminum 96 well plate holders from the door of the plate fridge and put them on ice blocks"
  check: "Position 48 tubes with their caps open into each of two aluminum racks as shown in the image (TO BE ADDED)"
  check: "Put the tube racks with tubes back into the plate fridge to keep them cold"
end

step
  description: "Prepare cells for aliquoting"
  warning: "Keep the cells on ice at all times!"
  check: "Decant the supernatant carefully"
  check: "Remove any liquid that is left carefully with a pipettor"
  check: "Add 1.6 mL of GYT and gently resuspend"
end

step
  description: "Measure the OD600"
  check: "In an eppendorf tube, add 990 ul GYT and 10 ul cells"
  check: "Use the nanodrop to measure the OD600"
  getdata
    y: number, "Enter the OD600"
  end
end
  
conc=(y*2.5*100000000000)
add=(((conc*1600)-(2.5*10000000000*1600))/(2.5*100000000000))
total_volume=(1600+add)
tubes=(total_volume/40)

step
  description: "Dilute the cell suspension by adding an additional %{add}ul GYT"
  warning: "Keep the cells on ice at all times!"
end  

step
  description: "Aliquot the cells"
  check: "Take out both aluminum plate holders with assembled tubes and immedietly put them on ice blocks"
  check: "Aliquot out 40ul of cells into each of the labeled 0.5 mL tubes"
  check: "If there are any tubes left over that did not receive a FULL 40ul aliquot, throw them away"
  getdata
    z: number, "How many aliquots were made?"
  end
  warning: "Continue to keep the cells cold at all times!"
end  

step
  description: "Put all of the filled tubes into a labeled freezer box and immedietly put this in the -80C freezer."
end  

#f=0

#while f<z
  produce
    ecomp_cells = z "DH5alpha Electrocompetent Aliquot"
    location: "M80.fourth_shelf"
  end
#  f=f+1
#end

log
  return: {e_coli_strain_type: ecomp_cells[:id]}
end

release [LB[0],water[0],glycerol[0],gyt[0],flask[0]]
release centrifuge_tubes
  
  
  
  
  
  
  
  
