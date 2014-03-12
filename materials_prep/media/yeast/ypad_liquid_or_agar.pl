information "Prepare unsterile bottle(s) of YPAD (rich yeast media), ready to be autoclaved."

argument
  n_bottle: number, "Enter the number of bottles you want to make (maximum of 4)."
  add_agar: string, "Add agar to the media? Enter Yes or No."
  volume: number, "The volume to make: 800, 400, or 200 (in mL)"
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

if volume != 200 && volume != 400 && volume != 800
  step
    description: "The LB volume was incorrectly entered as %{volume}."
    getdata
      volume: number, "Enter the volume of LB to make.", [200, 400, 800]
    end
  end
end

take
  yeast_extract = 1 "Bacto Yeast Extract"
  tryptone = 1 "Bacto Tryptone"
end

if volume == 800
    bottle_size =  "1 L Bottle"
elsif volume == 400
    bottle_size =  "500 mL Bottle"
elsif volume == 200
    bottle_size = "250 mL Bottle"
end

take bottles = n_bottle bottle_size

product_name = ""  # Initialize global variable
dextrose = []  # Initialize global variable (why is this one required?)
adenine = []  # Initialize global variable (why is this one required?)
agar = []  # Initialize global variable (why is this one required?)
stir_bars = []  # Initialize global variable (why is this one required?)
if add_agar == "Yes"
  if volume == 800
    product_name = "800 mL YPAD agar (unsterile)"
  elsif volume == 400
    product_name = "400 mL YPAD agar (unsterile)"
  elsif volume == 200
    product_name = "200 mL YPAD agar (unsterile)"
  end
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
  if volume == 800
    product_name = "800 mL YPAD liquid (unsterile)"
  elsif volume == 400
    product_name = "400 mL YPAD liquid (unsterile)"
  elsif volume == 200
    product_name = "200 mL YPAD liquid (unsterile)"
  end
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

step
  description: "Dextrose item hash"
  note: "%{dextrose}"
end

yeast_extract_name = yeast_extract[0][:name]
tryptone_name = tryptone[0][:name]
dextrose_name = dextrose[0][:name]
adenine_name = adenine[0][:name]

grams_agar = volume / 50.0
grams_tryptone = volume / 50.0
grams_dextrose = volume / 50.0
grams_yeast_extract = volume / 100.0
grams_adenine = volume / 12500.0

# Agar
if add_agar == "Yes"
  agar_name = agar[0][:name]
  include "includes/materials_prep/add_dry_reagent.pl"
    container: "each bottle"
    reagent: agar_name
    grams: grams_agar
  end
end

include "includes/materials_prep/add_dry_reagent.pl"
  container: "each bottle"
  reagent: tryptone_name
  grams: grams_tryptone
end

include "includes/materials_prep/add_dry_reagent.pl"
  container: "each bottle"
  reagent: dextrose_name
  grams: grams_dextrose
end

include "includes/materials_prep/add_dry_reagent.pl"
  container: "each bottle"
  reagent: yeast_extract_name
  grams: grams_yeast_extract
end

include "includes/materials_prep/add_dry_reagent.pl"
  container: "each bottle"
  reagent: adenine_name
  grams: grams_adenine
end

# Clean the spatula before returning it
include "includes/materials_prep/clean_spatula.pl"
end

step
  description: "Add deionized water"
  note: "Fill each bottle to the %{volume} mL mark with deionized water."
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
