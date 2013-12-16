argument
  plasmid_id: sample, "The plasmid to be diluted"
  final_conc: number, "The desired final plasmid concentration"
end

take
  falcon_tube = 1 "50 mL Molecular Grade Water aliquot"
  plasmid = item plasmid_id
end

step
  description: 
    "Label a 1.5 mL tube"
  note: 
    "Write 'D' on top of the tube."
  image: "label_1_5mL_tube"
end

produce
  r = 1 "Plasmid Stock" from plasmid[0]
  data
    concentration: 1
    unit: "ng/µL"
  end
  
release [falcon_tube[0],plasmid[0]]
