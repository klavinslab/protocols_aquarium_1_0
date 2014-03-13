information "Test vision error finding algorithms."

take
    bottles = 1 "1 L Bottle"
end

take
    lb_liquid = 1 "800 mL LB Agar (sterile)"
end

step
  description: "Add lb_liquid to empty bottle"
  note: "Pour some of the lb_liquid into the empty bottle"
  warning: "Do this quickly, do not leave the cap off of the sterile media bottle for too long"
end

release bottles

release lb_liquid
