#makes GYT for comp cells


step
  description:"This protocol makes 100ml of GYT for use in the elctrocompetent E. Coli protocol"
end

take
  bottle = 1 "100 mL Bottle"
  trp = 1 "Bacto Tryptone"
  extract = 1 "Bacto Yeast Extract"
  gly = 1 "50 percent Glycerol (sterile)"
end


step
  description: "Weigh out 0.125g of yeast extract and place it in the 100ml bottle."
end

step
  description: "Weigh out 0.25g of Tryptone and place it in the 100ml bottle."
end

step
  description: "Measure out 80mls of DI water and pour into the 100ml bottle"
end

step
  description: "Mix the contents of the bottle until all solids are dissolved."
end

step
  description:"Autoclave the bottle on the liquids cycle."
end

step
  description:"After the bottle has cooled pipette in 20mls of 50% glycerol into the 100ml bottle"
  note: "Mix the bottle after the glycerol is added"
end

produce
  r = 1 "100ml Sterile GYT" 
  location: "Bench"
  release bottle
end


