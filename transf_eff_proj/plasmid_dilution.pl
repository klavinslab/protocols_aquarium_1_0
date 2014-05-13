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
volume_of_plasmid = 0

if !begin_conc
  step 
    description: "Go to nanodrop to measure concentration of the plasmid stock"
    getdata
        input_conc: number, "Enter the concentration (a number without units) here"
    end
  end
end

if input_conc != 0
  volume_of_plasmid = 1.0 * volume * final_conc / input_conc
else 
  volume_of_plasmid = volume * final_conc / begin_conc
end

step
  description: "Make diluted stock of plasmid"
  check: 
    "Lable a 1.5 mL tube. Write 'D' on top of the tube."
  check:
    "Add %{volume} µL of TE into tube D."
  check:
    "Add %{volume_of_plasmid}µL of plasmid stock %{plasmid_id} to make the final concentration to be %{final_conc} ng/µL."
  check:
    "Mix the contents of the tube by using the Vortexer."
end

step
  description: "Aliquot into %{count} tubes"
  check:
    "Take out %{count} 1.5 mL tubes"
  check:
    "Aliquot %{aliquot} µL from tube D to each tube."
  check:
    "Throw out the tube D"
end

x = 0
while x < count
produce
  r = 1 "Plasmid Aliquot" from plasmid[0]
  data
    concentration: final_conc
    unit: "ng/µL"
  end
  note: "Write this ID number on the top of one of the remaining aliquot tubes."
  note: "Move all aliquots to the below location in the box labled 'Transformation Efficiency' when done labeling"
  location: "B1.165"
end
x = x + 1
end
  
release [falcon_tube[0],plasmid[0]]
