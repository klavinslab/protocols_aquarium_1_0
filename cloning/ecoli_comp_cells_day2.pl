information "Make e.coli electrocompetent cells!"

argument
  e_coli_id: sample array, "The 2 250 mL cultures of E coli that were innoculated yesterday."
end

take 
  cells = e_coli_id
  
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
end

produce
  x = "250 mL Flask of E coli cells" from ecoli[0]
end

step
  description: "Put both flasks into the 37 degree shaker incubator"
end
