argument
  filename: string, "Name of the parameter file to use"
end

require filename

p = parameters()

take
  primers = item p.primers
  plasmids = item p.plasmids
end

release concat(primers,plasmids)
