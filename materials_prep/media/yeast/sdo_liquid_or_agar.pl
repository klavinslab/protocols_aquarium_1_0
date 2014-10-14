require "protocols:materials_prep/lib/materials_prep.pl"

information "Make Synthetic Drop-out or Synthetic Complete media."
# TODO: Add supplement data to produced item


# FIXME: if dropping out only one aa, put drop out solutions on single take
argument
  n_bottle: number, "Enter the number of bottles you want to make (maximum of 4)."
  volume: number, "Enter the volume of media (in mL) you want to make 200, 400, 800 or 1600"
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


if volume != 200 && volume != 400 && volume != 800 && volume != 1600
  step
    description: "The volume preference was incorrectly entered as %{volume}"
    getdata
      volume: number, "What volume should be used?", [200, 400, 800, 1600]
    end
  end
end

bottle_type = ""
if volume == 200
  bottle_type = "250 mL Bottle"
elsif volume == 400
  bottle_type = "500 mL Bottle"
elsif volume == 800
  bottle_type = "1 L Bottle"
elsif volume > 800
  bottle_type = "2 L Bottle"
end

take
  bottles = n_bottle bottle_type
end

stir_bars = {}
if volume >= 800
  take
    stir_bars = n_bottle "Medium Magnetic Stir Bar"
  end
  step
    description: "Add stir bars"
    note: "Add one stir bar to each bottle."
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


take
  nitrogen_base = 1 "Yeast Nitrogen Base Without Amino Acids"
  dropout = 1 "Yeast Synthetic Drop-out Medium Supplements"
  dextrose = 1 "Dextrose"
  adenine = 1 "Adenine (Adenine hemisulfate)"
end


agar = []  # Initialize global variable
product_name = ""
if add_agar == "Yes"
  if add_his == "Yes" && add_leu == "Yes" && add_trp == "Yes" && add_ura == "Yes"
    product_name = "%{volume} mL SC agar (unsterile)"
  else
    product_name = "%{volume} mL SDO agar (unsterile)"
  end
  take
    agar = 1 "Bacto Agar"
  end
else
  if add_his == "Yes" && add_leu == "Yes" && add_trp == "Yes" && add_ura == "Yes"
    product_name = "%{volume} mL SC liquid (unsterile)"
  else
    product_name = "%{volume} mL SDO liquid (unsterile)"
  end
end


nitrogen_base_name = nitrogen_base[0][:name]
dropout_name = dropout[0][:name]
dextrose_name = dextrose[0][:name]
adenine_name = adenine[0][:name]


agar_grams = 0
dextrose_grams = 0
nitrogen_base_grams = 0
dropout_grams = 0
adenine_grams = 0
supplement_ml = 0
if volume == 200
  agar_grams = 4
  dextrose_grams = 4
  nitrogen_base_grams = 1.34
  dropout_grams = 0.28
  adenine_grams = 0.016
  supplement_ml = 2
elsif volume == 400
  agar_grams = 8
  dextrose_grams = 8
  nitrogen_base_grams = 2.68
  dropout_grams = 0.56
  adenine_grams = 0.032
  supplement_ml = 4
elsif volume == 800
  agar_grams = 16
  dextrose_grams = 16
  nitrogen_base_grams = 5.36
  dropout_grams = 1.12
  adenine_grams = 0.064
  supplement_ml = 8
else
  agar_grams = 16.0/800*volume
  dextrose_grams = 16.0/800*volume
  nitrogen_base_grams = 5.36/800*volume
  dropout_grams = 1.12/800*volume
  adenine_grams = 0.064/800*volume
  supplement_ml = 8.0/800*volume
end


#Agar
if add_agar == "Yes"
  agar_name = agar[0][:name]
  add_dry_reagent("each bottle", agar_name, agar_grams)
end


add_dry_reagent("each bottle", dextrose_name, dextrose_grams)
add_dry_reagent("each bottle", nitrogen_base_name, nitrogen_base_grams)
add_dry_reagent("each bottle", dropout_name, dropout_grams)
add_dry_reagent("each bottle", adenine_name, adenine_grams)


# Clean the spatula before returning it
clean_spatula()


release [nitrogen_base[0], dropout[0], dextrose[0], adenine[0]]
if add_agar == "Yes"
  release agar
end


step
  description: "Add Drop-Out Label"
  note: "Label a piece of white laboratory tape with '-His -Leu -Trp -Ura' and attach it to each bottle."
end


if add_his == "Yes" || add_leu == "Yes" || add_trp == "Yes" || add_ura == "Yes"
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
    note: "Using a serological pipet, add %{supplement_ml} mL of each sterile supplement you just got out. As you add each supplement, black it out with a marker on the piece of tape."
    warning: "Use a separate pipet for each supplement."
  end

  release supplements
end


step
  description: "Add deionized water"
  note: "Fill each bottle to the %{volume} mL mark with deionized water."
end


take
  hot_plate = 1 "Hot/Stir Plate"
end


step
  description: "Stir using the hot plate"
  note: "One at a time, set each bottle on the hot plate and mix at 700 rpm for 2 minutes."
end


release hot_plate


# FIXME: Should also mark as '-Ura', etc. Need to construct that string.
if volume >= 800
  produce
    produced_bottles = n_bottle product_name
    data
      his: add_his
      leu: add_leu
      trp: add_trp
      ura: add_ura
    end
    release bottles
    release stir_bars
    note: "Write %{product_name} and the date on a new label in addition to the above id number. Mark the label according to the solutions that were left out - mark red for -His, blue for -Leu, green for -Trp, purple for -Ura."
    location: "B1.320"
  end
else
  produce
    produced_bottles = n_bottle product_name
    data
      his: add_his
      leu: add_leu
      trp: add_trp
      ura: add_ura
    end
    release bottles
    note: "Write %{product_name} and the date on a new label in addition to the above id number. Mark the label according to the solutions that were left out - mark red for -His, blue for -Leu, green for -Trp, purple for -Ura."
    location: "B1.320"
  end
end
