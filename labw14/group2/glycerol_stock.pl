argument
  e_id2: sample("Transformed E coli Strain"), "Overnight suspension culture" 
  # User is prompted to select his desired suspension in order to begin the protocol
  
end


step
  description: "This protocol describes the preparation of glycerol stock from an overnight suspension."
  # Orients the user to this protocol's purpose
  
end



take 
  glycerol_sol = 1 "50 percent Glycerol (sterile)"  
  cryo_tube = 1 "Cryo Tube"
  overnight_culture = item e_id2
  # Tells the user what to gather for this protocol
  
end


# The following three steps tell the user what to do with the items he has gathered
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



produce
  r = 1 "Transformed E coli Glycerol Stock" from overnight_culture[0]
  release cryo_tube
  # The product is created and the user is told to put it in the freezer. The Cryo tube has been consumed.
  
end
  

release glycerol_sol
# Return Glycerol solution to the shelf.

release overnight_culture
# Fill the test tube that contained the overnight suspension with 20% bleach and leave in the dishwashing tube rack.

end
