information "Set up for making e.coli electrocompetent cells tomorrow."

argument
  e_coli_id: sample, "The E. coli glycerol stock that you want to make competent cells from."
end

take 
  flask = 2 "250 mL Baffled Flask"
  LB = 1 "800 mL LB liquid (sterile)"
end

step
  description: "Add 50mL LB broth into each of the 2 250mL flasks using a serological pipette."
end

release LB

take
  ecoli = item e_coli_id
end

step
  description: "Innoculate the flasks with E. coli"
  check: "Using a 100ul pipette tip, scrape some cells out of the glycerol stock and add them to the first flask"
  check: "Repeat the same thing (with a new pipette tip) for the second flask"
end

release ecoli

produce
  x = "250 mL Flask of E coli cells" from ecoli[0]
  release flask
  location: "37 degree shaker"
end

produce
  x = "250 mL Flask of E coli cells" from ecoli[0]
  location: "37 degree shaker"
end

step
  description: "Make sure both flasks are secure in the 37 degree shaker incubator"
end
