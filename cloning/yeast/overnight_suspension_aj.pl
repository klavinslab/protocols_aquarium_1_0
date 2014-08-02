information  "This protocol describes how to perform a yeast overnight"
argument
  yeast_strain_id: sample array, "Choose the plate/glycerol stock/yeast suspension you intended to start an overnight from"
  overnight_name: string array, "The exact name of yeast strain for the overnight"
end

num=length(yeast_strain_id)

take
  note: "Use a test tube rack to retrieve the 14 mL Test Tube"
  yeast_media = 1 "800 mL YPAD liquid (sterile)"
  test_tube = num "14 mL Test Tube"
end

step
  description: "Prepare overnight suspension media"
  check: "Label a 14 mL tube with your initials AND date"
  check: "Pipette 3 mL of YPAD media into the labeled 14 mL tube"
end

counter=0
overnight_id=[]
release yeast_media

foreach x in yeast_strain_id

  take
    yeast = item x
  end
  
  step
    description: "Innoculate with %{x}"
    bullet: "For liquid cultures: pipette 10ul of culture into tube"
    bullet: "For plates: Take a sterile pipette tip (10 µL tips), pick up a medium sized colony by gently scraping the tip to the colony. Tilt 14 mL tube such that you can reach the media with your tip. Open the tube cap, scrape colony into media, using a swirling motion. Place the tube back on the rack with cap closed."
    bullet: "For Glycerol Stocks: use a 100ul tip and vigerously scrape the glycerol stock to get a chunk of stock. Tilt 14 mL tube such that you can reach the media with your tip. Open the tube cap, scrape colony into media, using a swirling motion. Place the tube back on the rack with cap closed."
  end
  

  
  produce
    overnight = 1 "Yeast Overnight Suspension" from yeast
    note: "Place the test tube in 30 C incubator shaker at B13.125"
    location: "B13.125"
    release test_tube
  end
  
  release yeast
  overnight_id=append(overnight_id,overnight[:id])
  
  counter=counter+1
end

log
  return: {overnight_id: overnight_id}
end
