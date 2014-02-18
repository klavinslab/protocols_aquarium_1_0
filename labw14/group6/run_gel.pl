argument
  assembly1: sample, " Select the first PCR Result."
  assembly2: sample, " Select the second PCR Result."
  ladder_one: sample
  fragment_volume: number, "The volume of PCR fragment to load in µL."
end

step
    description: "Testing step"
end

produce
  s = 1 "Fragment Gel Lanes"

end

log
  return: { Fragment_Gel_Lanes_id: s[:id]}
end
