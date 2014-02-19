information "Pour a 50 mL agarose gel."


argument
  percentage: number, "Enter the percentage gel to make (e.g. 1 = 1%)"
  comb_n: number, "Enter the number of combs to use (1 or 2)."
end


step
  description: "Transfer this protocol to the gel room"
  note: "Log out, go to the gel room (A5, A6, A7), and log in there to run this protocol - it will be under 'Protocols > Pending Jobs'."
end


step
  description: "Work in the gel weigh area"
  note: "Work in the gel weigh area (A5.300-A5.305) until otherwise indicated."
end


take
  glasses = 1 "Clear Protective Glasses"
end


step
  description: "Put on the clear protective glasses"
end


take
  agarose = 1 "Ultrapure* Agarose"
end


gel_volume = 50.0
agarose_mass = (percentage / 100.0) * gel_volume
error = agarose_mass * 0.05
step
  description: "Add %{agarose_mass} g agarose to flask"
  note: "Go to the station at A5.300. Obtain a flask from on top of the microwave M2. Using a digital scale, measure out %{agarose_mass} g (+/- %{error} g) of agarose powder and add it to the flask. Add agarose by tipping and shaking the bag and remove excess to the waste container by folding the weigh paper."
  image: "gel_measure_agarose"
end


step
  description: "Clean up weigh area"
  note: "Using a 70%% ethanol spray bottle and kimwipes, wipe down the weigh area."
end


step
  description: "Add 1X TAE"
  note: "Get a graduated cylinder from on top of the microwave at A5.305. Measure and add 50 mL of 1X TAE from jug J2 at A5.500 to the flask."
  image: "gel_measure_tae"
end


step
  description: "Microwave into solution"
  bullet: "Swirl the flask to mix for about two seconds."
  bullet: "Microwave 70 seconds on high in microwave M2, then swirl. The agarose should now be in solution."
  bullet: "If it is not in solution, microwave 7 seconds on high, then swirl. Repeat until dissolved."
  warning: "Use a paper towel to handle the flask."
  image: "gel_in_solution"
end


step
  description: "Work in the gel pouring area"
  note: "For the remainder of this protocol, work in the gel pouring area (A7.320-A7.325). Carefully transfer the flask containing molten agar to A7.320 using a paper towel."
end


take
  gel_green = 1 "GelGreen Nucleic Acid Stain"
end


gel_green_volume = gel_volume / 10.0  # in µL
step
  description: "Add %{gel_green_volume} µL GelGreen"
  note: "Using a 10 µL pipetter, take up %{gel_green_volume} µL of GelGreen into the pipet tip. Expel the GelGreen directly into the molten agar (under the surface), then swirl to mix."
  warning: "GelGreen is supposedly safe, but stains DNA and can transit cell membranes (limit your exposure)."
  warning: "GelGreen is photolabile. Limit its exposure to light by putting it back in the box."
  image: "gel_add_gelgreen"
end


release [agarose[0], gel_green[0]]


take
  gel_box = 1 "49 mL Gel Box With Casting Tray (clean)"
end


if comb_n == 1
  step
    description: "Add comb"
    note: "Retrieve a 10-well purple comb from A7.325. Position the gel box With the electrodes facing away from you. Add a purple comb to the side of the casting tray nearest the side of the gel box, thicker side down. Make sure it is well-situated in the groove of the casting tray."
    image: "gel_comb_placement"
  end
else
  step
    description: "Add combs"
    note: "Retrieve two 6-well purple combs from A7.325. Position the gel box With the electrodes facing away from you. Add a purple comb to each casting tray groove, thicker side down. Make sure it is well-situated in the groove of the casting tray."
    image: "gel_comb_placement"
  end
end


take
  glove = 1 "Gel Pouring Glove"
end


step
  description: "Pour the gel"
  note: "Using the gel pouring autoclave glove, pour the gel from the flask into the casting tray. Pour slowly and in a corner for best results. Pop any bubbles with a 10 µL pipet tip."
  image: "gel_pouring"
end

release glove


produce
  gel = 1 "50 mL 1 Percent Agarose Gel in Gel Box"
  location: "A7.325"
  note: "Write the id on a piece of lab tape. Add your initials as well."
  release gel_box
end


step
  description: "Clean up!"
  check: "Place the graduated cylinder back on top of microwave M2."
  check: "Place the flask back on top of microwave M2."
end


release glasses
