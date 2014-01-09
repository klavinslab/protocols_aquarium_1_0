information "Prepare unsterile bottle(s) of 800 mL TB Media (rich media for bacteria), ready to be autoclaved."


product_name = "800 mL TB Liquid (unsterile)"


argument
  n_bottle: number, "Enter the number of bottles you want to make (maximum of 4)."
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


take
  bottles = n_bottle "1 L Bottle"
  tb_powder = 1 "Terrific Broth, modified"
end


step
  description: "Add temporary labels"
  note: "Using lab tape, number each bottle (from 1 up to 4)."
end


step
  description: "Remove autoclave tape"
  note: "Remove any autoclave tape from each bottle."
end


# Add LB Powder
tb_name = tb_powder[0][:name]
include "plankton/includes/materials_prep/add_dry_reagent.pl"
  container: "each bottle"
  reagent: tb_name
  grams: 38.08
end


# Clean the spatula before returning it
include "plankton/includes/materials_prep/clean_spatula.pl"
end


take
  glycerol = 1 "50 percent Glycerol (sterile)"
end


step
  description: "Add glycerol"
  note: "Add 12.8 mL of 50%% glycerol to each bottle using a serological pipetter and a 10 mL pipet (go above the 10 mL mark). Use a fresh pipet for each bottle. Make sure to expel all of the glycerol."
end


step
  description: "Add deionized water"
  note: "Fill each bottle to the 800 mL mark with deionized water."
end


step
  description: "Cap and mix."
  note: "Tightly close the caps on each bottle and shake until all contents are dissolved. To check for dissolution, let bottle rest for 10 seconds, and then pick up and look for sediment on the bottom. This should take approximately 20 seconds."
end


produce
  produced_bottles = n_bottle product_name
  release bottles
  note: "Write %{product_name} and the date on the label in addition to the above id number."
  location: "B1.320"
end


release [tb_powder[0], glycerol[0]]
