argument
  plasmid_id: sample, "The plasmid to be diluted"
  final_conc: number, "The desired final plasmid concentration"
  count: number, "Number of diluted aliquots you want to make"
end

take
  falcon_tube = 1 "50 mL TE aliquot"
  plasmid = item plasmid_id
end

step
  description: 
    "Label a 1.5 mL tube"
  note: 
    "Write 'D' on top of the tube."
  image: "label_1_5mL_tube"
end

x = 0
while x < count
produce
  r = 1 "Plasmid Stock" from plasmid[0]
  data
    concentration: final_conc
    unit: "ng/µL"
  end
end
x = x + 1
end
  
release [falcon_tube[0],plasmid[0]]
