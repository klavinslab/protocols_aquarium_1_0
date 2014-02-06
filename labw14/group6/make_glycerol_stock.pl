argument
  Transformed_E_coli_Strain_id: sample array, "Overnight suspension culture(s)" 
  # User is prompted to select his desired suspension in order to begin the protocol
  
end

n = length(Transformed_E_coli_Strain_id)

step
  description: "This protocol describes the preparation of glycerol stocks from overnight suspensions."
  # Orients the user to this protocol's purpose
  
end



take 
  glycerol_sol = 1 "50 percent Glycerol (sterile)"  
  cryo_tube = n "Cryo Tube"
  overnight_culture = item Transformed_E_coli_Strain_id
  # Tells the user what to gather for this protocol
  
end


# The following three steps tell the user what to do with the items he has gathered
step
  description: "Pipette 900 µL stock 50 percent Glycerol into each Cyro tube."
  warning: "Make sure not to touch the sides of the Glycerol bottle with the pipetter."
  
end

step
  description: "Pipette 900 µL of a suspended cell culture into the desired Cyro tube, repeat for each culture with different Cyro tubes."
  note: "Hold the cell culture test tube at an angle so that you can pipette accurately."
  note: "It will be helpful to label and keep track of each Cyro tube 1-5 before adding cell culture to keep track of their contents."
  
end

step
  description: "Vortex the Cryo tubes."
  note: "Hold against the vortexer for about thirty seconds at the highest setting."
  
end

step
  description: "Cap each tube and label them with your initials, an identifier, and date."
  warning: "Make sure to include the year on your label."
  
end

i = 0
r = []

while i < n
  produce
    y = 1 "Transformed E coli Glycerol Stock" from overnight_culture[i]
  end
  release cryo_tube
  # The product is created and the user is told to put it in the freezer. The Cryo tube has been consumed.
  r = append(r,y[:id])
  i = i+1
end
  

release glycerol_sol
# Return Glycerol solution to the shelf.

release overnight_culture
# Fill the test tube that contained the overnight suspension with 20% bleach and leave in the dishwashing tube rack.

end
