information "pour out lb sterile aliquots"

take
  bottles = 1 "800 mL LB liquid (sterile)"
end

step 
  description: "Pour 800mL LB liquid into sterile 50mL Falcon Tube"
  note: "Fill up a new Falcon Tube until the 800mL LB liquid bottle is empty."
  bullet: "How many aliquots did you make?"
  getdata
    num_aliquots: number, "Enter the number of aliquots you made (i.e number of 50mL Falcon tubes you used)."
  end
end

step
  description: "Do not physically take the next set of tubes."
  note: "The next step will ask you to take the number of Falcon Tubes you used. Do not actually physically take them (but do check the box). This is just so the inventory is correctly updated."
end

take
  falcon_tubes = num_aliquots "50 mL Falcon Tube"
end

produce
  produced_aliquots = num_aliquots "50 mL LB liquid aliquot (sterile)"
  release bottles
  note: "Write '50 mL LB',the date, and id number on each aliquot."
  location: "B3.555"
end

