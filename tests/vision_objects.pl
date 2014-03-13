information "Test vision error finding algorithms."

take
    bottles = 1 "1 L Bottle"
end

take
    lb_liquid = 1 "800 mL LB liquid (sterile)"
end

take
    petri = 1 "Small Petri Dish"
end

take
    falcon = "50 mL Falcon Tube"
end

step
  description: "Identify the empty bottle"
end

step
  description: "Identify the LB sterile"
end

step
  description: "Identify the Petri Dish"
end

step
  description: "Identify the Falcon Tube"
end

release bottles

release lb_liquid

release petri

release falcon
