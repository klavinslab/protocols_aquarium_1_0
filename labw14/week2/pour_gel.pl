information "Pour a 50 mL agarose gel."


argument
  percentage: number, "Enter the percentage gel to make (e.g. 1 = 1%)"
  comb_n: number, "Enter the number of combs to use (1 or 2)."
end


take
  gel_box = 1 "49 mL Gel Box With Casting Tray (clean)"
  agarose = 1 "Ultrapure* Agarose"
end


# FIXME: By convention there will always be beakers available for melting + pouring gels?
#   Idea: put stuff in the gel room:
#     Microwave
#     Beakers
#     Agarose
#     Combs
step
  description: "Go to the gel room (A5, A6, A7) to run this protocol."
end


gel_volume = 50.0
agarose_mass = (percentage / 100.0) * gel_volume
step
  description: "Measure and add agarose"
  note: "Go to the station at A5.300. Using a digital scale, measure out %{agarose_mass} g of agarose powder and add it to a clean beaker."
end


step
  description: "Add 1X TAE"
  note: "If the beaker is not graduated with a 50 mL mark, get a graduated cylinder from the rack at A1.505. Add 50 mL of 1X TAE from jug J2 at A5.500 to the beaker."
end


step
  description: "Microwave into solution"
  note: "Place the beaker in the microwave and heat on high until it begins to boil, then immediately stop the microwave. Without picking up the beaker directly with your hand, carefully swirl the (superheated) mixture. Repeat microwaving and swirling until the agarose has gone completely into solution (no agarose wisps are visible). When done, move to the station at A7.325 and take the beaker with you."
  bullet: "This strategy works with the white microwave:"
  bullet: "Microwave 35 seconds on high, then swirl."
  bullet: "Microwave 10 second on high, then swirl."
  bullet: "Microwave 7 seconds on high, then swirl. The agarose should now be in solution."
  warning: "Use a paper towel to handle the beaker."
end


take
  gel_green = 1 "GelGreen Nucleic Acid Stain"
end


step
  description: "Add GelGreen"
  note: "Using a 10 µL pipetter, pipet 5 µL of GelGreen directly into the agarose, then swirl to mix."
  warning: "GelGreen is supposedly safe, but stains DNA and can transit cell membranes (limit your exposure)."
end


release [agarose[0], gel_green[0]]


step
  description: "Allow the agarose to cool to 50°C"
  note: "Allow the agarose to cool to about 50°C on the benchtop (50°C should not hurt to touch). This should take 5 to 10 minutes."
  warning: "Pouring the gel when it's still boiling hot will probably result in burning yourself."
end


if comb_n == 1
  step
    description: "Add comb"
    note: "With the electrodes facing away from you, add a purple comb to the left side of the casting tray, thinner side down. Make sure it is well-situated in the groove on the casting tray."
  end
else
  step
    description: "Add combs"
    note: "With the electrodes facing away from you, add a purple comb to the left side of the casting tray, thinner side down. Make sure it is well-situated in the groove on the casting tray.\n\nRepeat for the second comb, but use the middle groove of the casting tray."
  end
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
  # FIXME: percentage should be in data field
  gel = 1 "50 mL 1 Percent Agarose Gel in Gel Box"
  release gel_box
end
