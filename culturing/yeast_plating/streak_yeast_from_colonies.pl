argument
  strain_array: sample("Yeast Strain") array, "Yeast strain to be streaked"
  plate_type: string array, "Plate type (YPAD, HIS, TRP, URA, LEU)"
end

information "This protocol is used to streak yeast strains from colonies onto new plates" 

ypad = 0
his = 0
trp = 0
ura = 0
leu = 0

i = 0
while i < length(plate_type)
  if plate_type[i] == "YPDA"
    ypad = ypad + 1
  elsif plate_type[i] == "HIS"
    his = his + 1
  elsif plate_type[i] == "TRP"
    trp = trp + 1
  elsif plate_type[i] == "URA"
    ura = ura + 1
  elsif plate_type[i] == "LEU"
    leu = leu + 1
  end
  i = i + 1
end

take
  strain = item strain_array
  his "SDO -His Plate (sterile)"
  trp "SDO -Ura Plate (sterile)"
  ura "SDO -Leu Plate (sterile)"
  leu "SDO -Trp Plate (sterile)"
end

j = 0
while j < length(plate_type)
  plate_name = plate_type[j]
  strain_id = strain_array[j]
  step
    check: "Select a medium size isolated colony from plate %{strain_id}. Mark desired colony with circle and intials and date"
    check: "Take a sterile pipette tip (10 µL tips), pick up your desired colony by gently scraping the tip to the colony, then transfer to the edge of new %{plate_name}."
    check: "Using a new pipette tip to streak the new plate."
  end
  produce
    y = 1 "Yeast Plate" from strain[j]
    location: "30º Incubator"
  end

j = j + 1
end

release strain
