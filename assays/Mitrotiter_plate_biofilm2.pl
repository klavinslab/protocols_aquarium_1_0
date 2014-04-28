##second day of microtiter plate biofilm assay

information "second part of microtiter plate biofilm assay"

take
  plate = "innoculate plate from previous day"
  innoc = 1 "96 prong innoculate" #if we don't have this I'll have to change this to something else
  well plate = 1 "96 well mitrotiter plate with lids"
  
end

step
  description: "use 96 prong to innoculate from previous night plate into the new 96 well plate"
end

step
  description: "incubate for 12 hours in 30 degree incubator" #12 hours is pretty arbitrary. not quite sure what the time needs to be
  bullet: "proceed to part 3 of this protocol after 12 hours"
  
end
  
  
