information  "This protocol describes how to set up a mating from a set of plates/Glycerol stock"

argument
  mata_strain_id: sample array, "The Mat a strain for mating"
  matalpha_strain_id: sample array, "The Mat alpha strain for mating"
  mated_strain: string array, "The exact name of yeast strain resulting from mating"
end

num=length(mated_strain)

take
  note: "Use a test tube rack to retrieve the 14 mL Test Tube"
  yeast_media = 1 "800 mL YPAD liquid (sterile)"
  test_tube = num "14 mL Test Tube"
end

step
  description: "Prepare culture tubes"
  check: "Label %{num} 14 mL tube with your initials AND date"
  check: "Pipette 1 mL of YPAD liquid into the labeled 14 mL tube"
end

counter=0
mated_strain_id=[]
release yeast_media

foreach x in mated_strain

  take
    yeast_a = item mata_strain_id[counter]
  end
  
  a_id=mata_strain_id[counter]
  step
    description: "Innoculate with %{a_id}"
    bullet: "For plates: Take a sterile pipette tip (10 µL tips), pick up a medium sized colony by gently scraping the tip to the colony. Tilt 14 mL tube such that you can reach the media with your tip. Open the tube cap, scrape colony into media, using a swirling motion. Place the tube back on the rack with cap closed."
    bullet: "For Glycerol Stocks: use a 100ul tip and vigerously scrape the glycerol stock to get a chunk of stock. Tilt 14 mL tube such that you can reach the media with your tip. Open the tube cap, scrape colony into media, using a swirling motion. Place the tube back on the rack with cap closed."
  end
  
  release yeast_a
  
  take
    yeast_alpha = item matalpha_strain_id[counter]
  end
  
  alpha_id=matalpha_strain_id[counter]
  step
    description: "Innoculate with %{alpha_id}"
    bullet: "For plates: Take a sterile pipette tip (10 µL tips), pick up a medium sized colony by gently scraping the tip to the colony. Tilt 14 mL tube such that you can reach the media with your tip. Open the tube cap, scrape colony into media, using a swirling motion. Place the tube back on the rack with cap closed."
    bullet: "For Glycerol Stocks: use a 100ul tip and vigerously scrape the glycerol stock to get a chunk of stock. Tilt 14 mL tube such that you can reach the media with your tip. Open the tube cap, scrape colony into media, using a swirling motion. Place the tube back on the rack with cap closed."
  end
  
  release yeast_alpha
  
  produce
    mating = 1 "Yeast Mating" of x
    note: "Place the test tube in 30 C incubator shaker at B13.125"
    location: "B13.125"
    release test_tube
  end
  mated_strain_id=append(mated_strain_id,mating[:id])
  
  counter=counter+1
end

log
  return: {mated_strain_id: mated_strain_id}
end

