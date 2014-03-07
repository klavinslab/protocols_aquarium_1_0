information "Make sterile solution of Tryptophan, Histidine, Leucine, or Uracil."

argument
  supplement_name: string, "Enter the type of solution you want to make: His, Trp, Leu, or Ura."
end

nonsterile_bottle = "the bottle labeled as nonsterile"

# Initialize global variables
supplement_type = ""
supplement_mass = 5
supplement_produced = ""

if supplement_name == "His"
  supplement_type = "L-Histidine"
  supplement_produced = "Histidine Solution"
end
if supplement_name == "Trp"
  supplemen_type = "L-Tryptophan Powder"
  supplement_produced = "Tryptophan Solution"
end
if supplement_name == "Leu"
  supplement_type = "L-Leucine Powder"
  supplement_produced = "Leucine Solution"
end
if supplement_name == "Ura"
  supplement_type = "Uracil"
  supplement_mass = 2.5
  supplement_produced = "Uracil Solution"
end

take
  bottles = 2 "500 mL Bottle"
end

step
  description: "Label bottles."
  note: "Label one bottle as 'nonsterile mixed solution of %{supplement_type}' and the other as 'sterile %{supplement_type}'."
end

take
  scale = 1 "Scale"
  boat = 1 "Small Weigh Boat"
  supplement_item = 1 supplement_type
end

include "includes/materials_prep/clean_spatula.pl"
  vessel_string: nonsterile_bottle
  reagent: supplement_type
  mass: supplement_mass
  boat_type: "Large Weigh Boat"
end

release concat(boat, scale)

step
  description: "Add deionized water"
  note: "Fill the bottle to the 500 mL mark with deionized water."
end

step
  description: "Cap and mix."
  note: "Tightly close the caps on the bottle and shake until all contents are dissolved. To check for dissolution, let bottle rest for 10 seconds, and then pick up and look for sediment on the bottom. This should take approximately 20 seconds."
end

if supplement_name == "Ura"
  take
    stir_plate = 1 "Hot/Stir Plate"
  end
  step
    description: "Heat bottle to 50°C on stir plate to dissolve uracil."
    note: "Using the heat plate, heat the bottle to 50°C. Shake to mix every few minutes. Stop when full dissolution occurs or only a very small (but persistent) amount of dry reagent remains."
  end

  release stir_plate
end

take
  filter = 1 "1 L Bottle Top Filter"
end

step
  description: "Attach filter to sterile bottle."
  note: "Uncap the sterile bottle. Quickly remove the filter from its wrapping and screw onto the bottle."
end

step
  description: "Attach vacuum hose to filter and turn on vacuum."
  note: "Bring the bottle + filter apparatus to B1.310. Attach to the vacuum hose. Turn on the vacuum by rotating the handle to be parallel to the tube."
end

step
  description: "Pour solution into filter."
  note: "Remove the lid from the filter. Pour the solution from %{nonsterile_bottle} into the filter (keep the filter bottle stable)."
end

step
  description: "Recap the sterile bottle."
  note: "When solution has run through the filter, turn off the vacuum, and remove the filter top. Immediately recap the bottle of sterile %{supplement_name} solution with its original (sterile) sterile cap."
end

release filter

produce
  product = 1 supplement_produced
  release [bottles[1]]
end

produce
  dirty_bottle = 1 "500 mL Bottle (dirty)"
end

release supplement_item
