argument
  plasmid_id: sample, "The plasmid to be diluted"
  final_conc: number, "The desired final plasmid concentration"
  count: number, "Number of diluted aliquots you want to make"
  aliquot: number, "Volume of each aliquots you want to make"
end

take
  falcon_tube = 1 "50 mL TE aliquot"
  plasmid = item plasmid_id
end

if count > 4
volume = aliquot * (count+1)
else
volume = aliquot * count
end

step
  description:
    "Lable a 1.5 mL tube"
  note:
    "Write 'D' on top of the tube."
end

step
  description:
    "Add %{volume} µL of TE into tube D."
end

step
  description:
    "Add calculated volume of plasmid stock to make the final concentration to be %{final_conc} ng/µL."
end

step
  description: 
    "Take out %{count} 1.5 mL tube"
  note: 
    "Add %{aliquot} µL of diluted plasmid from tube D to each tube."
end

step
  description:
    "Throw out the tube D"
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
