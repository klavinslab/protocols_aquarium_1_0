information "this job is used for measuring biofilm production of a strain"

argument
  strains: sample array , "bacterial strains to assay for biofilms" 
  media_choice: object , "assay media"
end

take
  bact = item strains 
  media = 1 media_choice
  well_plate = 1 "96 Well Flat Clear Bottom Plate"
end


#TODO: for filling & innoculation, write description using multichannel pipette
step
  description: "add 100ul media to each well in the 96 well plate"
end
  

#TODO: for more than one strain input figure out how to distrubute 
# between avail wells. 
step
  description: "innoculate bacterial strains"
#TODO: don't innoculate from glycerol stocks, innoc from an overnight
  note: "innoculate from glycerol stocks. 4 wells for each strain"
  bullet: "use plates if available. Otherwise, stab from glycerol stocks"
  bullet: "it may also be a good idea to make plates of each innoculate strain for future use, if plates are not available"
end

step
  description: "overnight"
  note: "incubate well plates overnight in 30 degree incubator"
  
end
  
produce
  assay_plate = 1 "96 Well Flat Clear Bottom Plate"
  data
    contents: "fill in with 8x12 array later"
  end
  location: "30C fridge thing" #TODO: look up real name.
  release well_plate
end


release bact
release media
  
  
