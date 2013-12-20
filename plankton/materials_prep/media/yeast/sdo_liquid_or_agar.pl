information "Make 800mL of Synthetic Drop-out or Synthetic Complete media."
# TODO: Use item :name key for includes
# TODO: Add supplement data to produced item


argument
  n_bottle: number, "Enter the number of bottles you want to make (maximum of 4)."
  add_agar: string, "Add agar to the media? Enter Yes or No."
  add_his: string, "Add histidine to the media? Enter Yes or No."
  add_leu: string, "Add leucine to the media? Enter Yes or No."
  add_trp: string, "Add tryptophan to the media? Enter Yes or No."
  add_ura: string, "Add uracil to the media? Enter Yes or No."
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


if add_his != "Yes" && add_his != "No"
  step
    description: "The histidine preference was incorrectly entered as %{add_his}"
    getdata
      add_his: string, "Should agar be added to the media?", ["Yes", "No"]
    end
  end
end


if add_leu != "Yes" && add_leu != "No"
  step
    description: "The leu preference was incorrectly entered as %{add_leu}"
    getdata
      add_leu: string, "Should leucine be added to the media?", ["Yes", "No"]
    end
  end
end


if add_trp != "Yes" && add_trp != "No"
  step
    description: "The trp preference was incorrectly entered as %{add_trp}"
    getdata
      add_trp: string, "Should tryptophan be added to the media?", ["Yes", "No"]
    end
  end
end


if add_ura != "Yes" && add_ura != "No"
  step
    description: "The ura preference was incorrectly entered as %{add_ura}"
    getdata
      add_ura: string, "Should uracil be added to the media?", ["Yes", "No"]
    end
  end
end


# 3 takes per page max
take
  bottles = n_bottle "1 L Bottle"
  stir_bars = n_bottle "Medium Magnetic Stir Bar"
end


step
  description: "Add stir bars"
  note: "Add one stir bar to each bottle."
end


step
  description: "Add temporary labels"
  note: "Using lab tape, number each bottle (from 1 up to 4)."
end


step
  description: "Remove autoclave tape"
  note: "Remove any autoclave tape from each bottle."
end


take
  nitrogen_base = 1 "Yeast Nitrogen Base Without Amino Acids"
  dropout = 1 "Yeast Synthetic Drop-out Medium Supplements"
  dextrose = 1 "Dextrose"
  adenine = 1 "Adenine (Adenine hemisulfate)"
end


if add_agar == "Yes"
  if add_his == "Yes" && add_leu == "Yes" && add_trp == "Yes" && add_ura == "Yes"
    product_name = "800 mL SC agar (unsterile)"
  else
    product_name = "800 mL SDO agar (unsterile)"
  end
  take
    agar = 1 "Bacto Agar"
  end
else
  if add_his == "Yes" && add_leu == "Yes" && add_trp == "Yes" && add_ura == "Yes"
    product_name = "800 mL SC liquid (unsterile)"
  else
    product_name = "800 mL SDO liquid (unsterile)"
  end
end


nitrogen_base_name = nitrogen_base[0][:name]
dropout_name = dropout[0][:name]
dextrose_name = dextrose[0][:name]
adenine_name = adenine[0][:name]


include "plankton/includes/materials_prep/add_dry_reagent.pl"
  container: "each bottle"
  reagent: nitrogen_base_name
  grams: 5.36
end


include "plankton/includes/materials_prep/add_dry_reagent.pl"
  container: "each bottle"
  reagent: dropout_name
  grams: 1.12
end


include "plankton/includes/materials_prep/add_dry_reagent.pl"
  container: "each bottle"
  reagent: dextrose_name
  grams: 16
end


include "plankton/includes/materials_prep/add_dry_reagent.pl"
  container: "each bottle"
  reagent: adenine_name
  grams: 0.064
end


#Agar
if add_agar == "Yes"
  agar_name = agar[0][:name]
  step
    description: "Clean the spatula"
    note: "Use 70%% ethanol and a new kim wipe to wipe off the spatula."
  end
  step
    description: "Measure and add 16 g of %{agar_name}"
    note: "Using a scale, weigh out 16 g of %{agar_name} and add to each bottle."
    image: "pouring_dry_reagent_into_1_L_bottle"
  end
  step
    description: "Clean the spatula"
    note: "Use 70%% ethanol and a new kim wipe to wipe off the spatula."
  end
end
# TODO: re-enable after include bugfix
#if add_agar == "Yes"
#  include "plankton/includes/materials_prep/add_dry_reagent.pl"
#    container: "each bottle"
#    reagent: agar_name
#    grams: 16
#  end
#end


# Clean the spatula before returning it
include "plankton/includes/materials_prep/clean_spatula.pl"
end


release [yeast_nitrogen_base[0], dropout[0], dextrose[0], adenine[0]]
if add_gar == "Yes"
  release agar
end


supplements = []
if add_his == "Yes"
  take
    his = 1 "Histidine Solution"
  end
  supplements = supplements + his
end
if add_leu == "Yes"
  take
    leu = 1 "Leucine Solution"
  end
  supplements = supplements + leu
end
if add_trp == "Yes"
  take
    trp = 1 "Tryptophan Solution"
  end
  supplements = supplements + trp
end
if add_ura == "Yes"
  take
    ura = 1 "Uracil Solution"
  end
  supplements = supplements + ura
end


step
  description: "Add sterile drop out supplements"
  note: "Label a piece of laboratory tape with '-His -Leu -Trp -Ura' and attach it to the 1 L bottle.\n\nUsing a serological pipet, add 8 mL of each sterile supplement you just got out. As you add each supplement, black it out with a marker on the piece of tape."
  warning: "Use a separate pipet for each supplement."
end


step
  description: "Add deionized water"
  note: "Fill each bottle to the 800 mL mark with deionized water."
end


take
  hot_plate = 1 "Hot/Stir Plate"
end


step
  description: "Stir using the hot plate"
  note: "One at a time, set each bottle on the hot plate and mix at 700 rpm for 2 minutes."
end


release hot_plate


produce
  produced_bottles = n_bottle product_name
  release bottles, stir_bars
  note: "Write %{product_name} and the date on the label in addition to the above id number."
  location: "B1.320"
end


release [yeast_nitrogen_base[0], dropout[0], dextrose[0], adenine[0]]
release supplements
if add_agar == "Yes"
  release agar
end
