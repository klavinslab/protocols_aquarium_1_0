argument
  matings_ids: sample array, "Enter yeast matings you want to plate."
  mating_names: string array, "Enter the exact name of the mated strain." 
  plate_type: number array, "Enter a number that corresponds to a given plate type for each transformation. 1= -Ura -Trp Plate, 2= -Ura -His Plate, 3= -Ura -Leu Plate, 4= -Trp -His Plate, 5= -Trp -Leu Plate, 6= -His -Leu Plate"
end

take
  matings = item matings_ids
  note:"Take a rack and bring these to the cloning bay"
end

counter=0
foreach z in matings
  mid=matings_ids[counter]
  if plate_type[counter]==1
    take
      1 "SDO -Ura -Trp Plate (sterile)"
    end
  elsif plate_type[counter]==2
    take
      1 "SDO -Ura -His Plate (sterile)"
    end
  elsif plate_type[counter]==3
    take
      1 "SDO -Ura -Leu Plate (sterile)"
    end
  elsif plate_type[counter]==4
    take
      1 "SDO -Trp -His Plate (sterile)"
    end
  elsif plate_type[counter]==5
    take
      1 "SDO -Trp -Leu Plate (sterile)"
    end
  elsif plate_type[counter]==4
    take
      1 "SDO -His -Leu Plate (sterile)"
    end
  end
  
  step
    description: "Preparing plate"
    check: "Write your initials and the date on the plate near the edge"
  end
  
  step
    description: "Plating the mating"
    check: "Vortex the mating on setting 4 to resuspend yeast"
    check: "Pipette 10ul of %{mid} onto the plate near, but not too close, to the edge of the plate."
    check: "Take a 10ul pipette tip in you hand and dip the tip into the droplet of yeast culture. Pull the tip down the plate in a zig-zag pattern gently so as not to rip the agar."
  end
  
  produce
    1 "Yeast Plate" of mating_names[counter]
    location: "30º Incubator"
    release z
  end
  counter=counter+1
end


