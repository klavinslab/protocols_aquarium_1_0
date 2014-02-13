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
  plate_array = item Transformed_E_coli_Strain_plate_array
  media_tube = 1 "50 mL Falcon Tube" #I could not find "50mL conical", so I used this instead
  glucose = 1 "Minimal M9 Broth"
  kan = 1 "200X 1 mL Kanamycin Aliquo"
  amp = 1 "100X 1 mL Ampicillin Aliquot"
  pipette = 1 "Serological Pipette"
  tips = 2 "5 mL Serological Pipette Tips"
  culture_tubes = m "14 mL Test Tube"
 #TODO: Check all of these arguments with Leandra to confirm they are correct
end

step
 description: "Prepare 40mL of M9 media with (1:200) ampicillin and (1:500) kanomyacin"
 check: "Pipette 40mL of 0.4%% Glucose M9 media (%{glucose}) into the 50mL falcon tube (%{media_tube})"
 check: "Pipette 200uL of Kanomyacin (%{kan}) into the 50mL falcon tube"
 check: "Pipette 80uL of Ampicillin (%{amp}) into the 50mL falcon tube"
 check: "Swish the falcon tube around a few times to mix"
end

step
 description: "Label the culture tubes"
 check: "Label %{cycles} culture tubes with DL046"
 check: "Labe1 %{cycles} culture tubes with DL104"
 check: "Label %{cycles} culture tubes with DL147"
 #TODO: replace DL064 etc with references from the sample array argument
end

step
 description: "Add 3mL media to each culture tube"
 check: "Use electric serological pipette to add 3ml of you prepared (M9 with amp and kan) into each culture tube."
end


release concat(glucose, kan, amp, pipette)

step
 description: "Add cells to each culture tube"
 check: "Using a 100uL pipette tip, extract a single colony from plate DL046, and swish it around in one of the culture tubes marked DL046"
 check: "Repeat this %{cycles - 1} more times with new pipette tips and new colonies, until you have 4 total culture tubes labeled DL046 each containing celss from the DL046 plate"
 check: "Repeat the above two steps for each plate DL108 and DL 147, so that you end up with %{cycles} culture tubes containing each strain for a total of %{n} tubes" 
#TODO: Repace the above code with something more modular, based on an arbitrary number of cycles and strains
end

step
 description: "place the tubes in the 37C shaker"
 check: "Place the %{n} culture tubes in a tube rack and load them into the 37C shaker."
 note: "This will incubate for 18hrs (overnight)"
end

#release [cell_culture_tube_array[0], glycerol[0]]
release concat(plate_array)
end
