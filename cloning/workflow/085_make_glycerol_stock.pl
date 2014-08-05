argument
  e_id2: sample array, "Overnight suspension culture" 
end
step
  description: "This protocol describes the preparation of glycerol stock from an overnight suspension."
end
take 
  glycerol_sol = 1 "50 percent Glycerol (sterile)"  
  cryo_tube = 1 "Cryo Tube"
  overnight_culture = item e_id2
end

step
  description: "Pipette 900 µL stock 50 percent Glycerol into the Cyro tube."
  warning: "Make sure not to touch the sides of the Glycerol bottle with the pipetter."
  
end

step
  description: "Pipette 900 µL of the suspended cell culture into the Cyro tube."
  note: "Hold the cell culture test tube at an angle so that you can pipette accurately."
  
end

step
  description: "Vortex the Cryo tube."
  note: "Hold against the vortexer for about thirty seconds at the highest setting."
  
end

step
  description: "Cap the tube and label it with your initials and date."
  warning: "Make sure to include the year on your label."
  
end

x = 0

while x < length(e_id2)
  produce
    r = 1 "Transformed E coli Glycerol Stock" from overnight_culture[0]
    release cryo_tube
    # The product is created and the user is told to put it in the freezer. The Cryo tube has been consumed.
  end
  
  x = x + 1
end
  

release glycerol_sol
# Return Glycerol solution to the shelf.

release overnight_culture
# Fill the test tube that contained the overnight suspension with 20% bleach and leave in the dishwashing tube rack.

end
