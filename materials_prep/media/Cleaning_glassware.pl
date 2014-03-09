information "Clean general glassware"

 step
       description: "How many bottles do you want to clean?"
        n_bottle: number, "Enter the number of bottles you want to clean (maximum 9)."
        volume: number, "Enter the media volume (100, 200, 400, or 800 mL)."
    end
    
    if n_bottle < 1 || n_bottle > 9
  step
    description: "The number of bottles was incorrectly entered as %{n_bottle}."
    note: "You can only specify 1-9 bottles!"
    getdata
      n_bottle: number, "Enter the number of bottles you want to clean.", [1, 2, 3, 4, 5, 6, 7, 8, 9,]
    end
  end
end
    
    if volume != 100 && != 200 && volume != 400 && volume != 800
  step
    description: "The bottle volume was incorrectly entered as %{volume}."
    getdata
      volume: number, "Enter the volume of the bottle to be cleaned.", [100, 200, 400, 800]
    end
  end
end

bottle_type = "150 mL Bottle"
if volume == 100
bottle_type = "250 mL Bottle"
if volume == 200
  bottle_type = "250 mL Bottle"
elsif volume == 400
  bottle_type = "500 mL Bottle"
elsif volume == 800
  bottle_type = "1 L Bottle"
end

    take
    n_bottles
 step
      description: "Remove Caps, lids, any autoclave tape, and any labelling tape."
    end
 step
      description: "Rinse bottles once"
      note: "Rinse more than once if solids, e.g agar, remain after first rinse"
    end
  step
       description: "Add dishwashing soap to each bottle"
       note: "Fill each bottle just below halfway with water"
      end
  step
       description: "Use a large brush to scrub around the inside of bottles"
       note: "If the large brush doesn't fit, use the next size down.
       Be sure to brush the area around the neck/mouth of the bottles as well."
      end
  step
       description: "Rinse with water 4-5 times as needed after scrubbing"
       note: "if soap bubbles remain rinse as needed-dependent on amount of soap used and size of bottle – smaller bottles may require less rinses."
      end
  step
       description: "Hang on hooks to dry (A8.410)"
       end
  step
       description: "Scrub inside of bottle caps/lids"
       note: "Use a small amount of soap, use the same brush as for the glassware, and rinse 2-3 times.
       Place caps upright on drying mesh (located under hooks) to dry after sufficient rinsing."
      end
  produce
  produced_bottles = n_bottle
  release bottles
  location: "A8.410"
end
