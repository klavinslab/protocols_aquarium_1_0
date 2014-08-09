information "This protocol is used to streak plate from glycerol stock"

take 
  x1 = 8 "YPAD Plate (sterile)"
end

step
  description: "Take out glycerol stock YKL998, YKL1000, YKL1006, YKL1007, YKL1648, YKL1719, Yeast Strain 432, YKL1." 
end

step
  description: "Use a pipette with sterile tip to scrape a reasonable amount of stock and transfer to the plate"
  timer: { hours: 0, minutes: 1, seconds: 30 }
end

step
  description: "Use a sterile pipette tip to streak out plate"
end

produce
    y1 = 1 "Yeast Plate" of "pGP8GAL-GAVNY, pGP6GAL-AFB2 in W303alpha"
    location: "A1.110"
    release x1
end

