information: "Pour a 50 mL agarose gel."


# FIXME: make combs an argument?
argument
  percentage = number, "Enter the percentage gel to make (e.g. 1 = 1%%)"
end


take
  gel_box = 1 "Gel Box (clean)"
  agarose = 1 "Agarose Powder"
  gel_green = 1 "1000X GelGreen"
end


# By convention there will always be beakers available for melting + pouring gels?


gel_volume = 50.0
agarose_mass = (percentage / 100.0) * gel_volume
step
  description: "Measure and add agarose"
  note: "Using a digital scale, measure out %{agarose_mass} g of agarose powder and add it to a clean beaker."
end


step
  description: "Add 1X TAE"
  note: "If the beaker is not graduated with a 50 mL mark, get a graduated cylinder. Add 50 mL of 1X TAE to the beaker using either graduation marks on the beaker or a graduated cylinder."
end


step
  description: "Microwave into solution"
  note: "Place the beaker in the microwave and heat on high until it begins to boil, then immediately stop the microwave. Without picking up the beaker directly with your hand, carefully swirl the (superheated) mixture. Repeat microwaving and swirling until the agarose has gone completely into solution (no agarose wisps are visible)."
  bullet: "This strategy works with the white microwave:"
  bullet: "Microwave 35 seconds on high, then swirl."
  bullet: "Microwave 10 second on high, then swirl."
  bullet: "Microwave 7 seconds on high, then swirl. The agarose should now be in solution."
end


step
  description: "Add GelGreen"
  note: "Using a 10 µL pipetter, pipet 5 µL of GelGreen directly into the agarose, then swirl to mix."
end


step
  description: "Allow the agarose to cool to 50°C"
  note: "Allow the agarose to cool to about 50°C on the benchtop. This should take 5 to 10 minutes."
  warning: "Pouring the gel when it's still boiling hot will probably result in burning yourself."
end


step
  description: "Add combs"
  note: "With the electrodes facing away from you, add a purple comb to the left side of the casting tray, thinner side down. Make sure it is well-situated in the groove on the casting tray."
end


take
  gloves = 1 "Autoclave Gloves"
end


step
  description: "Pour the gel"
  note: "Using autoclave gloves, pour the gel from the beaker into the casting tray. Pour slowly and in a corner for best results. Pop any bubbles with a 10 µL pipet tip."
end

release gloves


produce
  gel = 1 "1%% Agarose Gel."
end
