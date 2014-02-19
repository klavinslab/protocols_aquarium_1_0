argument
  yeast_transformation_mixtures: sample array, "Mixture to transform"
end

num = length(yeast_transformation_mixtures)

#y = yeast_transformation_mixtures

step
 description: "This protocol describes how to heat shock the yeast mixture"
end

#take
#  mixture_tube = item yeast_plasmid_mixture
#end

step
  description: "Heat shock yeast - plasmid mixture"
  note: "Place all the 1.5 mL tubes with yeast transformation mixtures into the heat block 42C for 15 min, location: B3.355."
  bullet: "Tubes should have the following id numbers: %{yeast_transformation_mixtures}."
end

ii = 0

while ii < length(yeast_transformation_mixtures)
  modify
    yeast_transformation_mixtures[ii]
    location:"B14.310"
    inuse:0
  end
  ii = ii + 1
end

step
  description: "Wait 15 minutes here"
  timer: { hours: 0, minutes: 15, seconds: 0 }
end
