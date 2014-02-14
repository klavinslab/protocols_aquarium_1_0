argument
  fragment1: sample, "Fragment stock 1 for Gibson reaction"
  fragment2: sample, "Fragment stock 2 for Gibson reaction"
end

step
  description: "Test."
end

produce
  r = 1 "Gibson Reaction Result"
  release x
end
