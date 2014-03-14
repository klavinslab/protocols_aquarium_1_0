information "Prepare 100x MgSo4 CaCl2 solution for M9 media"


# TODO: make component items in inventory
# TODO: write protocol (should be short)
take
  bottle = 1 "1 L Bottle"
  salts = 1 "Difco M9 Minimal Salts, 5x"
end

step
  description: "Weigh out M9 Salts"
  note: "Using place large weigh boat on scale and zero. Weigh out 45.12 g"
end

step
  description: "Pour salts into bottle"
  note: "Fold the boat and carefully pour the salts into the bottle"
end

step
  description: "Fill bottle to 800 mL with DI Water"
  note: "Be sure to stop filling as soon as 800 mL is reached"
end

step
  description: "Cap bottle and shake until the salts are dissoved"
end


release [salts[0]]


produce
  m9 = 1 "800 mL Difco M9 Minimal Salts Solution, 5X (unsterile)"
  release bottle
end
