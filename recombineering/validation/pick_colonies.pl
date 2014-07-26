argument
  plates: sample array, "plates to pick"
  n_col: number, "number of colonies per plate."
end

take
  taken_plates = item unique(plates)
  lb = 1 "50 mL LB liquid aliquot (sterile)"
end 

foreach p in taken_plates
  pid = p[:id]
  step
    description: "Inspect the plate with ID %{pid}"
    getdata 
      count: number, "Enter the approximate number of colonies (eg 1,2,3,10,50,100,1000)"
    end
  end
  
  if n>0
    step
      description: "Collect %{n_col} 1.5 mL tubes and place them in a tube rack."
    end

    ii = 0
    while ii<n_col
      step
        description: "pipette 1 mL of LB into an empty tube"
      end
  
      produce silently
        tube = 1 "Overnight suspension" from p
        location: "SI4"
      end

      step
        description: "Pick a colony"
        note: "Read these steps once through first"
        bullet: "Grab a pipette tip from the green box with your dominant hand.  Pick up the agar side of the plate infront of you with your other hand."
        bullet: "Select an isolated colony to pick."
        bullet: "Using the pointy end of the pipett tip, scrape the colony you just choose with a short stroke.  It may not look like you picked up much."
        bullet: "Dip the tip into the 1.5 mL tube of LB below the liquid surface and scape it along the side to dislodge any cells."
        bullet: "Cap the tube and write the item number " + to_string(tube[:id]) + " on top of a sticker on the top of the tube."
        warning: "make sure to use sterile technique and to never touch the end of the pipette tip to anything but a single colony and a single tube"
      end
      
      ii = ii+1
    end
  end
end

step
  description: "incubate overnight"
  note: "place all the 1.5 mL tubes you just made into SI4"
  warning: "Make sure they go into the 30 degree incubator.  Putting them in the hotter incubator will kill them"
end

release taken_plates
release lb
