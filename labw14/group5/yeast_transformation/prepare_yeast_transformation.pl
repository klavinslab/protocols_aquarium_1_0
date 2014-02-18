argument
  yeast_aliquot_id: sample array, "Diluted yeast culture"
  numbers_set_id: number array, "Number of aliquot tubes of each yeast strain that were made."
  fragment_id: sample, "Digested plasmid"
end

numbers_set = numbers_set_id

num = length(yeast_aliquot)

step
 description: "This protocol describes how to prepare yeast trasformation mix"
end

take
  yeast_aliquot_tubes = item yeast_aliquot_id
  digested_plasmid    = item fragment_id
end

ii = 0
r = []

number_we_can_make = length(fragment_id) + 1

while ii < number_we_can_make

  if ii == 1 # CONTROL TUBE
    produce
        y = 1 "Yeast Transformation Mixture" from yeast_aliquot_tubes[ii]
        release yeast_aliquot_tubes[ii]
    end
  else
  # NOT CONTROL
  end
  
  r = append(r,y[:id])
  ii=ii+1
end

log
  return: { yeast_plasmid_mixture: r }
end

release digested_plasmid
