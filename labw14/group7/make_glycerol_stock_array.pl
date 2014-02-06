argument
 Transformed_E_coli_Strain_tube_array: sample array, "An array of overnight suspensions of transformed E. Coli cells (in culture tubes)"
end

step
 description: "This protocol will prepare multiple cell cultures for long-term storage in glycerol stock."
end

n = length(Transformed_E_coli_Strain_tube_array)

take
  cell_culture_tube_array = item Transformed_E_coli_Strain_tube_array
  glycerol = 1 "50 percent Glycerol (sterile)"
  sterile_tube = n "Cryo Tube"
  note: "Be sure to use STERILE technique when removing cryo tubes from their container. This means:
         shake out one of the sterile tubes into your gloved hand while holding the outside of the bag,
         rather than putting your hand into the bag to take one out."
end


step
 description: "Add gylcerol to each cryo tube"
 check: "Pipette 900uL of the 50%% glycerol stock to each 1.5mL sterile tube"
 note: "Be sure to use STERILE technique while handling the gylcerol stock.  If you contaminate this stock
        it wil ruin everyone else's experients! This means:"
 bullet: "Loosen caps before loading the pipette tip"
 bullet: "Hold the cap in your gloved hand while extracting fluid with the micro-pipetter, rather than placing it on the lab bench."
 bullet: "Do not touch the inside of the tube with the micropipetter."
 bullet: "Do not re-use pipette tips."
end

step
 description: "Add cell culture to each cryo tube"
 note: "In the following steps, you will add cell culture to each cryo tube in turn, label it with its ID number, your initial, todays date" 
end

i = 0
r = []
while i < n
 step
  description: "Add overnight suspension culture to the cryo tube"
  check: "Pipette 900uL of cell suspension number %{Transformed_E_coli_Strain_tube_array[i]} to a new 1.5mL sterile tube (containing glycerol)"
  check: "Vortex 1.5mL this sterile tube for 15s at speed 10 using the VWR analog vortex mixer."
 end
 
 produce
  s = 1 "transformed E. Coli in 50%% glycerol" from cell_culture_tube_array[i]
  note: "Make sure to also add your initials and todays date (mm/dd/yyyy) in addition to the item ID number.
        This glycerol/cell culture mixture will potentially be stored in the -80 C freezer for many months,
        so be sure to label both the cap and the side of the tube for redundancy."
 end
 r = append(r,s[:id])
 i=i+1
end

#log
#  return: {glycerol_stock_array_id: r}
#end

#step
#  description: "the glycerol_stock_array_id is %{r}"
#end


#release [cell_culture_tube_array[0], glycerol[0]]
release concat(cell_culture_tube_array, glycerol)
