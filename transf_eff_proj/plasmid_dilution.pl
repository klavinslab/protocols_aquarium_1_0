argument
  plasmid_id: sample, "The plasmid to be diluted"
  final_conc: number, "The desired final plasmid concentration (ng/µL)"
  count: number, "Number of diluted aliquots you want to make"
  aliquot: number, "Volume (µL) of each aliquots you want to make"
end

take
  falcon_tube = 1 "50 mL TE aliquot"
  plasmid = item plasmid_id
end

volume = 0
if count > 4
volume = aliquot * (count+1)
else
volume = aliquot * count
end

begin_conc = plasmid[0][:data][:concentration]
input_conc = 0

if !begin_conc
  step 
    description: "Go to nanodrop to measure concentration of the plasmid stock"
    getdata
        input_conc: number, "Enter the concentration (a number without units) here"
    end
  end
  begin_conc = input_conc
end

step
  description:
    "Lable a 1.5 mL tube.  conc is %{begin_conc} and input conc is %{input_conc}"
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
