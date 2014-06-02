information "This protocol describes how to move plates from incubator to deli fridge."

argument
  plate: sample
end

take
  plate_incubated = item plate
end

step
  description: "Wrap up the plate with parafilm and store in the deli fridge"
  check: "Wrap up the plate with parafilm."
  check: "Put the plate in the Box 7 in deli fridge located at D2.100."
end

modify
  plate_incubated[0]
  location: "DFP.7"
  inuse: 0
end
