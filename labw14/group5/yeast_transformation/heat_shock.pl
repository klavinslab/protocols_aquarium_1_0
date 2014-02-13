argument
  yeast_plasmid_mixture: sample array, "Mixture to transform"
end

num = length(yeast_plasmid_mixture)

step
 description: "This protocol describes how to heat shock the yeast mixture"
 warning: "You're going to shock heat %{num} yeast mixture tubes"
end

take
  mixture_tube = item yeast_plasmid_mixture
end

ii = 0
r = []

while ii < length(Transformed_yeast_plate)

  ii=ii+1
end
