information "This protocol is used to streak plate from glycerol stock"

take 
  x1 = 1 "YPAD Plate (sterile)"
end

step
  description: "Take out glycerol stock YKL 1682	pGP8GAL-GAVNY, pGP6GAL-AFB2"
end

step
  description: "Use a pipette with sterile tip to scrape a reasonable amount of stock and transfer to the plate"
end

timer: { hours: 0, minutes: 1, seconds: 30 }

step
  description: "Use a sterile pipette tip to streak out plate"
end

produce
    y1 = 1 "Yeast Plate" of "pGP8GAL-GAVNY, pGP6GAL-AFB2 in W303alpha"
    release x1
end

