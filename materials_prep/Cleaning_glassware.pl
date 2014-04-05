information "Clean general glassware"
# FIXME: NEED TO ADD "PRODUCE"
 argument
        n_bottle: number array, "Enter the number of each type of bottle you want to clean (maximum 9)."
        volume: number array, "Enter the media volume (100, 250, 500, or 1000 mL)."
    end
    
    if volume != 100 && volume != 250 && volume != 500 && volume != 1000
  step
    description: "The bottle volume was incorrectly entered as %{volume}."
    getdata
      volume: number, "Enter the volume of the bottle to be cleaned.", [100, 250, 500, 1000]
    end
  end
end

bottle_type = "100 mL Bottle"
if volume == 100
bottle_type = "250 mL Bottle"
elsif volume == 250
  bottle_type = "250 mL Bottle"
elsif volume == 500
  bottle_type = "500 mL Bottle"
elsif volume == 1000
  bottle_type = "1 L Bottle"
end

    if volume == 100
    product_name == "100 mL Bottle (unsterile)"
  elsif volume == 250
    product_name = "250 mL Bottle (unsterile)"
  elsif volume == 500
    product_name = "500 mL Bottle (unsterile)"
  else
    product_name = "1000 mL Bottle (unsterile)"
  end

 step
      description: "Remove Caps, any autoclave tape, and any labelling tape."
    end
    
 step
      description: "Rinse bottles once"
      note: "Rinse more than once if solids, e.g agar, remain after first rinse"
    end
    
  step
       description: "Add a small amount of dishwashing soap to each bottle"
       note: "Fill each bottle just below halfway with water after the addition of soap"
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
       note: "Use a small amount of soap, scrub inside with the same brush as for the glassware, and rinse 2-3 times.
       Place caps upright on drying mesh (located under hooks) to dry after sufficient rinsing."
      end
      
  end
  end
