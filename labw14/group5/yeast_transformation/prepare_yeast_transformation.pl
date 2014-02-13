argument
  yeast_aliquot: sample array, "Diluted yeast culture"
  fragment: sample, "Digested plasmid"
end

num = length(yeast_aliquot)

step
 description: "This protocol describes how to prepare yeast trasformation mix"
 warning: "You're going to make %{num} overnight suspension tubes"
end

take
  yeast_tube = item yeast_aliquot
  digested_plasmid = item fragment
end

ii = 0
r = []

while ii < length(Transformed_yeast_plate)

  produce
      y = 1 "???????????????"
  end
  
  r = append(r,y[:id])
  ii=ii+1
end

log
  return: { yeast_plasmid_mixture: r }
end

release concat(yeast_tube, digested_plasmid,)
