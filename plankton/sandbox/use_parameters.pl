input
  p = "plankton/sandbox/parameters.json"
end

take
  primers  = item p[:primers]
  plasmids = item p[:plasmids]
end

release concat(primers,plasmids)
