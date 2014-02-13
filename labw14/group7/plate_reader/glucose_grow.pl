argument
 Transformed_E_coli_Strain_plate_array: sample array, "An array of agarose-streaked colonies to grow in 0.4 percent Glucose M9 media"
#TODO: add an extra agument to account for the number of induction cycles to perform on plate reader
end

step
 description: "This protocol will grow multiple cell colonies in glucose."
end

strains = length(Transformed_E_coli_Strain_plate_array)
cycles = 4
n = strains * cycles
#TODO: cycles = 4 should be replaced with an arbitrary number of induction cycles passed as an argument

take
 media_tube = 1 "50 mL Falcon Tube" #I could not find "50mL conical", so I used this instead
 glucose = 1 "Minimal M9 Broth"
 kan = 1 "200X 1 mL Kanamycin Aliquot"
 amp = 1 "100X 1 mL Ampicillin Aliquot"
 pipette = 1 "Serological Pipette"
 tips = 2 "5 mL Serological Pipette Tips"
 culture_tubes = n "14 mL Test Tube"
 note: "Be sure to grab a tube rack to hold all of the culture tubes"
 #TODO: Check all of these arguments with Leandra to confirm they are correct
end

step
 description: "Prepare 40mL of M9 media with (1:200) ampicillin and (1:500) kanomyacin"
 check: "Pipette 40mL of 0.4%% Glucose M9 media into the 50mL falcon tube"
 check: "Pipette 200uL of Kanomyacin into the 50mL falcon tube"
 check: "Pipette 80uL of Ampicillin into the 50mL falcon tube"
 check: "Swish the falcon tube around a few times to mix"
end

step
 description: "Label the culture tubes"
 check: "Label %{cycles} culture tubes with DL046"
 check: "Label %{cycles} culture tubes with DL104"
 check: "Label %{cycles} culture tubes with DL147"
 #TODO: replace DL064 etc with references from the sample array argument
end

step
 description: "Add 3mL media to each culture tube"
 check: "Use electric serological pipette to add 3ml of your M9 media (with amp and kan) into each culture tube."
end

release [glucose[0], kan[0], amp[0], pipette[0]]

take
 plate_array = item Transformed_E_coli_Strain_plate_array
end

step
 description: "Add cells to each culture tube"
 check: "Using a 100uL pipette tip, extract a single colony from plate DL046, and swish it around in one of the culture tubes marked DL046"
 check: "Using a new 100uL pipette tip extract another single colony from plate DL046, and swirl it around in another culture tube labeled DL046. Repeat this until you have DL046 cells in all %{cycles} of your tubes labeled DL046."
 check: "Repeat the above two steps for plates DL108 and DL147, so that you end up with %{strains} sets of %{cycles} culture tubes loaded with cells, for a total of %{n} tubes" 
#TODO: Repace the above code with something more modular, based on an arbitrary number of cycles and strains
end

step
 description: "Place the tubes in the 37C shaker"
 check: "Load the tube rack containing your %{n} cell culture tubes into the 37C shaker."
 note: "This will incubate for 18hrs (overnight)"
end

#release [cell_culture_tube_array[0], glycerol[0]]
release plate_array[0]
end
