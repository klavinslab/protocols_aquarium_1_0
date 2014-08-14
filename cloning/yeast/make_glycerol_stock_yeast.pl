argument
  overnight_array: sample array, "Overnight suspension culture" 
end

step
  description: "This protocol makes glycerol stocks from overnight suspensions."
end

n_tubes = length(overnight_array)

take 
  glycerol_sol = 1 "50 percent Glycerol (sterile)"  
  cryo_tube = n_tubes "Cryo Tube"
  overnight_culture = item overnight_array
end

step
  description: "Pipette 900 µL of 50 percent Glycerol stock into each Cyro tube."
  warning: "Make sure not to touch the inner side of the Glycerol bottle with the pipetter."
end

glycerol_stock_output_ids = []
x = 0
while x < length(overnight_array)
  y = overnight_array[x]
  step
    check: "Pipette 900 µL of item %{y} into the a Cyro tube."
    check: "Cap the Cryo tube and then vortex on a table top vortexer for about 20 seconds"
  end

  produce
    glycerol_stock = 1 "Yeast Glycerol Stock" from overnight_culture[x] 
    release cryo_tube
  end
  x = x + 1
  glycerol_stock_output_ids = append(glycerol_stock_output_ids,glycerol_stock[:id] 
end

release glycerol_sol
# Return Glycerol solution to the shelf.

release overnight_culture
# Fill the test tube that contained the overnight suspension with 20% bleach and leave in the dishwashing tube rack.
log
  return: {glycerol_stock_output_ids: glycerol_stock_output_ids}  
end
