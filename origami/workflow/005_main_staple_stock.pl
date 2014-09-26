##DNA origami requires 3 kind of stocks for creation.
##  1 - common stock of staples. Here are the staples, which will not be 
##      modified in any experiment.
##  2 - filler stock of standard staples. Those are ones, which in other 
##      experiments may be substitured to custom
##      staples, but in this particular experiment the standard ones are used.
##  3 - stock of custom staples. Those are staples which are different from 
##      standard.
##This protocol creates a stock of filler standard staples.
##They are specific for a given experiment.

argument
  initials: string, "Your initials or another 2-3 letter identifier for tube labeling"
  staples_plate: sample("Primer"), "96 wells plate with DNA staples"
  remove_wells: string array, "List the position of staples, which you will ever want to substitute to custom staples. Those staples will be removed from stock. Example: A10. String."
  stock: string, "Name of the resulted stock. Don't forget to create correspondent sample in inventory."
end

# Initializing constants
final_conc = 4000 # uM
Stock_conc = 400000 # uM
stock_vol = 5 # uL
staples_remove_number = length(remove_wells)


# Taking stuff
take
  plate_item = item(staples_plate)
end


# Grab stuff
step
  description: "Collect stuff:"
  check: "Multichannel pipettor 2-20 uL or 2-10 uL"
  check: "New red box filled with 20 uL tips. Make sure all tips are in place"
  check: "2 stripes of PCR tubes 0.3 uL"
  check: "1.5 uL eppendorf tube"
end


# Prepare stuff
step
  description: "Prepare stuff:"
  check: "Remove the cover from 96 wells plate with staples."
  check: "Make sure the staple solutions in the plate are melted"
  check: "Cut 4 PCR tubes from one of the strips and place them in green holder, so there are 12 tubes in line."
  check: "Label the 1.5 uL eppendorf tube."
  check: "Open the red box with all tips. Orient it so corner A1 is facing top left. From now on, do not move around red tip box."
end
    

# Get rid of wells with unused staples
counter = 0
while counter < staples_remove_number
  current_position = remove_wells[counter]
  step
    description: "Get rid of unused staples"
    check: "Remove tip of the position %{current_position} from red box."
    note: "You can place this tip to the other red box, and use it later."
  end
  counter = counter + 1
end


# Mixing staples
step
  description: "Mix staples together"
  check: "Set multichannel pipettor to 5 uL volume"
  check: "Pick tips from line A of red box"
  check: "Pipette staples from line A of a staple 96 wells plate. Make sure all tips got equal amount of solution"
  check: "Transfer solution to PCR tubes."
  check: "Repeat with all the other lines. All lines should be mixed in only one line of PCR tubes"
  check: "Transfer solutions from all PCR tubes to 1.5 uL eppendorf tube"
  check: "Vortex 1.5 uL eppendorf tube."
end


