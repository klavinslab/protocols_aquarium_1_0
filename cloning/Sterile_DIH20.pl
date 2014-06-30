##This protocol makes 800ml of sterile DI water



step
  description: "This protocol makes 800ml of sterile DI water"
end

take
  bottle = 1 "1 L Bottle"
end

step
  description:"Fill the 1 L bottle with 800ml of DI water."
end

step
  description: "Place autoclave tape on the bottle"
end

step
  description: "Place bottle in autoclave and run the 15 minute and 121ºC cycle"
end

produce
  r = 1 "800ml Sterile DI-H2O" 
  location: "Bench"
  release bottle
end
