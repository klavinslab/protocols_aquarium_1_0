information "Prepare aliquots of antibiotic stocks (Amp, Kan, or Chlor)."


argument
  antibiotic_type: string, "Enter the type of antibiotic aliquots you want to make (options are Amp, Kan, or Chlor)."
end


if antibiotic_type != "Amp" && antibiotic_type != "Kan" && antibiotic_type != "Chlor"
  step
    description: "The antibiotic type was incorrectly entered."
    getdata
      antibiotic_type: string, "Enter the type of antibiotic stock you want to make.", ["Amp", "Kan", "Chlor"]
    end
  end
end


if antibiotic_type == "Amp"
  step
    description: "How many ampicillin stock bottles do you want to use?"
    getdata
      n_bottles: number, "Enter the number of ampicillin stock bottles you want to use.", [1, 2, 3, 4]
    end
  end
  take
    antibiotic_stock = n_bottles "Ampicillin Stock"
  end
  antibiotic_label = "Amp"
  aliquot_number = n_bottles * 4
  product_name = "100X 1mL Ampicillin Aliquot"
elsif antibiotic_type == "Kan"
  take
    antibiotic_stock = 1 "Kanamycin Stock"
  end
  antibiotic_label = "Kan"
  aliquot_number = 8
  product_name = "200X 1mL Kanamycin Aliquot"
else
  take
    antibiotic_stock = 1 "Chloramphenicol Stock"
  end
  antibiotic_label = "Chlor"
  aliquot_number = 2
  product_name = "1000X 1mL Chloramphenicol Aliquot"
end


step
  description: "Take out and label 1.5 mL tubes"
  note: "Take out and close %{aliquot_number} of 1.5 mL tubes. Label their tops with '%{antibiotic_label}'."
end


step
  description: "Make 1 mL aliquots"
  note: "Using a 1000 µL micropipetter, aliquot 1 mL to each 1.5 mL tube from the antibiotic stock. If you are using ampicillin, take out and label more 1.5 mL tubes as necessary."
  getdata
    exact_count: string, "Did you make exactly %{aliquot_number} aliquots?", ["Yes", "No"]
  end
end


if exact_count == "No"
  step
    description: "How many aliquots did you make?"
    getdata
      number_made: number, "How many aliquots did you make? Include partial aliquots in your count"
    end
  end
else
  number_made = aliquot_number
end


produce
  produced_aliquots = number_made product_name
  note: "Write the id number on the side of each aliquot."
end


release antibiotic_stock
