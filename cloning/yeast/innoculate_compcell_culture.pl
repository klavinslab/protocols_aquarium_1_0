argument
  strains_id: sample array, "The overnights of the strains you want to make comp cells out of"
end

number = length(strains_id)

take
  flasks = number "250 mL Baffled Flask"
  ypad = 1 "800 mL YPAD liquid (sterile)"
end

step
  description: "Go to media bay."
end


foreach x in strains_id
  step
    description: "Making culture flasks up."
    check: "Add 50ml of YPAD media to the 250ml baffeled flask using a serological pipette"
    check: "Put a peice of tape on its side for labeling"
    note: "MAKE SURE TO NOT TOUCH THE TIP OF THE PIPETTE TO ANYTHING (Tubes, bottle etc.)."
  end
end

release ypad

step
  description: "Take flasks to cloning bay."
end

take
  strains = item unique(strains_id)
end

yeast_50ml_culture_id=[]
foreach x in strains
  x_id = x[:id]
  step
    description: "Innoculating Cultures"
    check: "Add 1ml of the overnight labeled %{x_id} to one of the unlabeled flasks."
  end
  produce
    y = 1 "Yeast 50ml culture" from x
    location: "30C Shaker"
    release flasks
  end
  yeast_50ml_culture_id = append(yeast_50ml_culture_id,y[:id])
end

step
  description: "Grow cultures for 5 hours"
  check: "Put flasks in the 30C shaker."
  check: "Set a timer for 5 hours."
end

log 
  return: {yeast_50ml_culture_id: yeast_50ml_culture_id}
end



