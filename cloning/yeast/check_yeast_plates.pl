argument
  yeast_plate_ids: sample array, "Enter the plates which you want to be checked."
end

tab = []

#foreach x in yeast_plate_ids
#  tab = append(tab,x)
#end

step
  description: "Retrieve plate"
  check: "Go to 30C incubator and remove the plates with the following ID numbers"
#  table: tab
end

step
  check: "Look at each plate carefully. Seperate the ones that have colonies from the ones that dont."
  check: "Get a rough estimate of the number of colonies on each plate. If there are less than 20 count them and write the number down on the plate, if not then simply seperate them into a more than 20 pile"
end

step
  check: "Email the grad student whose initials are on the plates with a report. The format should be plate_id: # of colonies (0, a count for less than 20 or just more than 20). AJ/AK - arjunkhakhar at gmail.com, MG - miles, DY - david, NB- nick"
end

step
  check: "Wrap the plates that have colonies in parafilm and put in the fridge according to their location in aquarium, leave the plates without colonies on the benchtop"
end

