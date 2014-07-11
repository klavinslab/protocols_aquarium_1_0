argument
  aliquot_id: number, "The ID of the comp cell box/batch to discard."
end

take
  discard = item aliquot_id
end



step
  description: "Throw away the aliquots in the box"
end



modify 
    discard[0]
    location: "deleted"
    inuse: -1
    quantity: -1
end
