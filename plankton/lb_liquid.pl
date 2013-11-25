information "Prepare unsterile bottle(s) of 800 mL LB Media (rich media for bacteria), ready to be autoclaved."

product_name = "800 mL LB Liquid (unsterile)"

argument
  n_bottle: number, "Enter the number of bottles you want to make (maximum of 4)"
end

if n_bottle < 1 || n_bottle > 4

  step
    description: "There were more than 4 bottles specified or the number is negative"
    note: "You can only specify 1-4 bottles!"
    getdata
      n_bottle: number, "Enter the number of bottles you want to make.", [ 1, 2, 3, 4 ]
    end
  end

end

take
  bottles = n_bottle "1 L Bottle"
  lb_powder = 1 "Difco LB Broth, Miller"
end

bottle_string = "Bottles"

step
  description: "Remove autoclave tape"
  note: "Remove any old autoclave tape from 1 L bottle(s)."
end

step 
  description: "Clean the spatuala"
  note: "Use 70 percent ethanol and a kimwipe to wipe off the spatula."
end

step
  description: "Add LB powder"
  note: "Plate a large weigh boat on the scale.
         Zero the scale.
         Using a spatula, add 20g of the Difco LB Broth powder to the boat.
         Pour into bottle using a corner of the weigh boat.
         Lightly flick to dislodge remainder of the powder."
  image: "pouring_dry_reagent_into_1_L_bottle"
end

step
  description: "Add deionized water"
  note: "Fill bottle(s) to the 800 mL mark with deionized water."
end

step
  description: "Cap and mix."
  note: "Tightly close the cap(s) on bottle(s) and shake (each) until all contents are dissolved.
         To check for dissolution, let bottle rest for 10 seconds, and then pick up and look for sediment on the bottom. 
         This should take approximately 20 seconds."
end

produce
  produced_bottles = n_bottle product_name
  release bottles
  note: "Write %{product_name} on the label in additon to the above id number.
         The standard location for LB is B1.320"
end

release lb_powder
