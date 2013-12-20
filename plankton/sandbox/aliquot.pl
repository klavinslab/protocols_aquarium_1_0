information "Take a 50 mL aliquot of media from an 800 mL bottle"

media_list = [ "LB", "TB", "SC", "YPAD" ]

step
  description: "Choose the Type of Media"
  getdata
    type: string, "Type", media_list
  end
end

bottle_name  = "800 mL " + type + " liquid (sterile)"
aliquot_name = "50 mL " + type + " liquid aliquot (sterile)"
  
take
  bottle = 1 bottle_name
  tube = 1 "50 mL Falcon Tube"
end

step
  description: "Transfer"
  note: "Transfer 25mL of %{type} media from the media bottle to the falcon tube."
end

produce
  aliquot = 1 aliquot_name 
  release tube
end

step
  description: "Would you like to remove this aliquot from the Aquarium?"
  getdata
    answer: string, "Answer", [ "Yes", "No" ]
  end
end

if answer == "Yes"

  modify aliquot
   quantity: 0
  end

end

release bottle

