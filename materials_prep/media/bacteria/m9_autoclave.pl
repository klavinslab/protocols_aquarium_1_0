information "prep sterile m9 salts and water for m9 protocol"

take 
  bottle = 2 "1 L Bottle"
  salts = 1 "Difco M9 Minimal Salts, 5x"
end

step
  description: "Add 600 mL DI or distilled water to each bottle"
end

step
  description: "label bottles"
  bullet: "label one bottle 'M9 salts'"
  bullet: "label the other 'sterile water'"
end

step
  description: "Add M9 salts"
  note: "Add 11.28g M9 salts to the bottle labeled 'm9 salts'"
end

step
  description: "Autoclave bottles"
  bullet: "Add a strip of autoclave tape to each bottle"
  bullet: "Make sure the cap of each bottle is slightly loose so gas can vent"
  bullet: "Place in autoclave and run at 121c for 15 minutes or the 'liquides cycle' depending on which machine you use."
end

release salts 

produce silently
  w = 1 "DI Water, Sterile"
  location: "autoclave"
  release bottle
end

log
  return: { water: w[:id]}
end

