information "Make media aliquots using 14 mL culture tubes, 50 mL falcon tubes, 125 mL flasks, or 250 mL flasks."


step
  description: "What type of media do you need?"
  note: "Choose the source of media you want to aliquot."
  getdata
    media_type: string, "Media Type", ["800 mL LB liquid (sterile)",
                                       "800 mL TB liquid (sterile)",
                                       "800 mL SC liquid (sterile)",
                                       "800 mL SDO liquid (sterile)".
                                       "800 mL YPAD liquid (sterile)",
                                       "400 mL TB plus Amp liquid (sterile)",
                                       "400 mL TB plus Kan liquid (sterile)"]
    container: string, "Type of container", ["14 mL Test Tube",
                                             "14 mL Disposable Test Tube",
                                             "50 mL Falcon Tube",
                                             "125 mL Baffled Flask",
                                             "250 mL Baffled Flask"]
    volume: number, "Volume of media per aliquot (in mL)"
    n_aliquots: number, "Number of aliquots to make"
  end
end


take
  media = 1 media_type
end


if container == "14 mL Test Tube" || container == "125 mL Baffled Flask" || container == "250 mL Baffled Flask"
  take
    containers = n_aliquots container
  end
else
  step
    description: "Gather disposable container(s)."
    note: "Gather %{n_aliquots} %{container}(s).\n\nDisposable 14 mL culture tubes are in B1.240.\n\n50 mL Falcon tubes are in B1.170."
  end
end


step
  description: "Pipet aliquots"
  note: "Using the serological pipettor and 25 mL serological pipettes, transfer %{volume} mL of %{media_type} into each %{container}.\n\nUse a fresh 25 mL pipette every time you return to the media source. Conserve pipettes by drawing enough media into the pipettor to aspirate into multiple aliquots."
end


release media


# Containers disappear into the ether. FIXME?
if container == "14 mL Test Tube" || container == "125 mL Baffled Flask" || container == "250 mL Baffled Flask"
  modify
    containers
    quantity: 0
  end
end
step
  description: "Enjoy your aliquots!"
  note: "The aliquot(s) produced are for your personal use and are not tracked by the Aquarium system."
end
