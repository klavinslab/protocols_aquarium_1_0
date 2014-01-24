information "Prepare unsterile bottle(s) of 800 mL YPAD (rich yeast media), ready to be autoclaved."
# FIXME: add black stripe to plates
# Add stir bar


argument
  n_bottle: number, "Enter the number of bottles you want to make (maximum of 4)."
  add_agar: string, "Add agar to the media? Enter Yes or No."
end


if n_bottle < 1 || n_bottle > 4
  step
    description: "The number of bottles was incorrectly entered as %{n_bottle}."
    note: "You can only specify 1-4 bottles!"
    getdata
      n_bottle: number, "Enter the number of bottles you want to make.", [1, 2, 3, 4]
    end
  end
end


if add_agar != "Yes" && add_agar != "No"
  step
    description: "The agar preference was incorrectly entered as %{add_agar}"
    getdata
      add_agar: string, "Should agar be added to the media?", ["Yes", "No"]
    end
  end
end


# 3 takes per page max
take
  bottles = n_bottle "1 L Bottle"
  yeast_extract = 1 "Bacto Yeast Extract"
  tryptone = 1 "Bacto Tryptone"
end
if add_agar == "Yes"
  product_name = "800 mL YPAD agar (unsterile)"
  take
    dextrose = 1 "Dextrose"
    adenine = 1 "Adenine (Adenine hemisulfate)"
    agar = 1 "Bacto Agar"
    stir_bars = n_bottle "Medium Magnetic Stir Bar"
  end
  step
    description: "Add stir bars"
    note: "Add one stir bar to each bottle."
  end
else
  product_name = "800 mL YPAD liquid (unsterile)"
  take
    dextrose = 1 "Dextrose"
    adenine = 1 "Adenine (Adenine hemisulfate)"
  end
end


step
  description: "Add temporary labels"
  note: "Using lab tape, number each bottle (from 1 up to 4)."
end


step
  description: "Remove autoclave tape"
  note: "Remove any autoclave tape from each bottle."
end


yeast_extract_name = yeast_extract[0][:name]
tryptone_name = tryptone[0][:name]
dextrose_name = dextrose[0][:name]
adenine_name = adenine[0][:name]


# Agar
if add_agar == "Yes"
  agar_name = agar[0][:name]
  include "plankton/includes/materials_prep/add_dry_reagent.pl"
    container: "each bottle"
    reagent: agar_name
    grams: 16
  end
end


include "plankton/includes/materials_prep/add_dry_reagent.pl"
  container: "each bottle"
  reagent: tryptone_name
  grams: 16
end


include "plankton/includes/materials_prep/add_dry_reagent.pl"
  container: "each bottle"
  reagent: dextrose_name
  grams: 16
end


include "plankton/includes/materials_prep/add_dry_reagent.pl"
  container: "each bottle"
  reagent: yeast_extract_name
  grams: 8
end


include "plankton/includes/materials_prep/add_dry_reagent.pl"
  container: "each bottle"
  reagent: adenine_name
  grams: 0.064
end


# Clean the spatula before returning it
include "plankton/includes/materials_prep/clean_spatula.pl"
end


step
  description: "Add deionized water"
  note: "Fill each bottle to the 800 mL mark with deionized water."
end


step
  description: "Cap and mix."
  note: "Tightly close the caps on each bottle and shake until all contents are dissolved. To check for dissolution, let bottle rest for 10 seconds, and then pick up and look for sediment on the bottom. This should take approximately 60 seconds."
end


if add_agar == "Yes"
  produce
    produced_bottles = n_bottle product_name
    release bottles
    release stir_bars
    note: "Write %{product_name} and the date on the label in addition to the above id number."
    location: "B1.320"
  end
else
  produce
    produced_bottles = n_bottle product_name
    release bottles
    note: "Write %{product_name} and the date on the label in addition to the above id number."
    location: "B1.320"
  end
end


release [yeast_extract[0], tryptone[0], dextrose[0], adenine[0]]
if add_agar == "Yes"
  release agar
end
