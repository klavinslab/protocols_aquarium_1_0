information "Prepare sterile bottle(s) of antibiotic stocks (Amp, Kan, or Chlor)."


argument
  antibiotic_type: string, "Enter the type of antibiotic stock you want to make (options are Amp, Kan, or Chlor)."
  n_bottles: number, "Enter the number of bottles you want to make."
  # TODO: input check n_bottles
end


if antibiotic_type != "Amp" && antibiotic_type != "Kan" && antibiotic_type != "Chlor"
  step
    description: "The antibiotic type was incorrectly entered as %{antibiotic_type}."
    getdata
      antibiotic_type: string, "Enter the type of antibiotic stock you want to make.", ["Amp", "Kan", "Chlor"]
    end
  end
end


if antibiotic_type == "Amp"
  take
    antibiotic = n_bottles "Ampicillin Sodium Salt"
  end
elsif antibiotic_type == "Kan"
  take
    bottles = n_bottles "100 mL Bottle"
    antibiotic = 1 "Kanamycin Sulfate"
  end
else
  take
    bottles = n_bottles "100 mL Bottle"
    antibiotic = 1 "Chloramphenicol"
  end
end

step
  description: "Add temporary labels"
  note: "Using lab tape, number each bottle."
end


step
  description: "Remove autoclave tape"
  note: "Remove any old autoclave tape from each bottle."
end


if antibiotic_type == "Kan"
  include "plankton/includes/materials_prep/add_dry_reagent.pl"
    container: "each bottle"
    reagent: "%{antibiotic}"
    grams: 0.5
  end

  # Clean the spatula before returning it
  include "plankton/includes/materials_prep/clean_spatula.pl" end

  take
    water = 1 "Molecular Biology Grade Water"
  end

  step
    description: "Add 50 mL molecular grade water"
    note: "Using a serological pipetter, add 50 mL molecular grade water to each bottle. Use a new pipet for each bottle."
  end
elsif antibiotic_type == "Chlor"
  include "plankton/includes/materials_prep/add_dry_reagent.pl"
    container: "each bottle"
    reagent: "%{antibiotic}"
    grams: 0.34
  end

  # Clean the spatula before returning it
  include "plankton/includes/materials_prep/clean_spatula.pl" end

  take
    ethanol = 1 "95% Ethanol"
  end

  step
    description: "Add 10 mL of 95%% ethanol"
    note: "Using a serological pipetter, add 10 mL of ethanol to each bottle. Use a new pipet for each bottle."
  end
else
  take
    water = 1 "Molecular Biology Grade Water"
  end

  step
    description: "Add 20 mL of molecular grade water"
    note: "Using a serological pipetter, add 20 mL of molecular grade water to each small bottle of dry ampicillin. Use a new pipet for each bottle and recap immediately after aspiration."
  end
end

step
  description: "Vortex each bottle"
  note: "Shake and vortex each bottle for about 10 seconds to mix."
end


if antibiotic_type == "Amp"
  produce
    produced_bottles = n_bottle "Ampicillin Stock"
    release antibiotic
    note: "Write Ampicillin Stock and the date on the label in addition to the above id number."
  end
elsif antibiotic_type == "Kan"
  produce
    produced_bottles = n_bottle "Kanamycin Stock"
    release bottles
    note: "Write Kanamycin Stock and the date on the label in addition to the above id number."
  end
  release [antibiotic[0], water[0]]
else
  produce
    produced_bottles = n_bottle "Chloramphenicol Stock"
    release bottles
    note: "Write Chloramphenicol Stock and the date on the label in addition to the above id number."
  end
  release [antibiotic[0], ethanol[0]]
end
