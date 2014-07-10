argument
  e_coli_strain_id: number, "The ID of the comp cell box/batch to discard."
end

take
  discard = item e_coli_strain_id
end

step
  description: "Throw away aliquots in box {%e_coli_strain_id}"
  note: "Go to the minus 80 freezer, fourth shelf and discard the ecoli aliquots in box ID {%e_coli_strain_id}"
end

#step
#  description: "Delete aliquots in box {%e_coli_strain_id} from the inventory."
#  note: "Go to Inventory->Basic->Cloning and delete the electrocompetent aliquot with ID {%e_coli_strain_id}"
#end


modify 
    discard[0]
    location: "deleted"
    inuse: 0
end



