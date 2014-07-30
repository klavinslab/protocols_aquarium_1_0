argument
  strains_id: sample array, "The overnights of the strains you want to make comp cells out of"
end

number = length(strains_id)

take
  number "250 mL Baffled Flask"
  1 "800 mL YPAD liquid (sterile)"
end

step
  description: "Go to media bay."
end


foreach x in strains_id
  step
    description: "Making culture flasks up."
    check: "Add 50ml of YPAD media to the 250ml baffeled flask using a serological pipette"
    check: "Label the flask with a peice of tape that says %{x}"
    note: "MAKE SURE TO NOT TOUCH THE TIP OF THE PIPETTE TO ANYTHING (Tubes, bottle etc.)."
  end
end

step
  description: "Take flasks to cloning bay."
end

take
  strains = item unique(strains_id)
end

foreach x in strains_id
  step
    description: "Innoculating Cultures"
    check: "Add 1ml of the overnight labeled %{x} to one of the unlabeled flasks."
    check: "Label the peice of tape with the ID number %{x}"
    note: "MAKE SURE TO NOT TOUCH THE TIP OF THE PIPETTE TO ANYTHING (Tubes, bottle etc.)."
  end
end

step
  description: "Grow cultures for 5 hours"
  check: "Put flasks in the 30C shaker."
  check: "Set a timer for 5 hours."
end

foreach x in strains
  produce
    1 "Yeast 50ml culture" from x
    location: "30C Shaker"
  end
end



