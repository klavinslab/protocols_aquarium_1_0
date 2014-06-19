information "Set up for making e.coli electrocompetent cells tomorrow."

argument
  e_coli_id: sample, "The E. coli glycerol stock that you want to make competent cells from."
  e_coli_strain: string, "The E. coli strain name that you are making competent cells of"
end

take 
  flask = 2 "250 mL Baffled Flask"
  LB = 1 "800 mL LB liquid (sterile)"
end

step
  description: "Label both flasks with the strain name: %{e_coli_strain}."
end

step
  description: "Add 50mL LB broth into each of the 2 250mL flasks using a serological pipette."
end

take
  ecoli = item e_coli_id
end

step
  description: "Using a 100ul pipette tip, scrape some cells out of the glycerol stock and add them to the first flask"
end

release ecoli

step
  description: "Put both flasks into the 37 degree shaker incubator"
end

release concat(flask,LB)
