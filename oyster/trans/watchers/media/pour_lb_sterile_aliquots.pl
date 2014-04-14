information "pour out lb sterile aliquots"

take
  bottles = 1 "800 mL LB liquid (sterile)"
end

step 

end

step
  description: "Enter the number of 50mL aliquots you made from a 1L Bottle of LB (sterile)."
  note: "You can only specify 1-4 bottles!"
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

