argument
  yeast_transformation_mixtures: sample array, "Mixture to transform"
end

num = length(yeast_transformation_mixtures)

step
 description: "This protocol describes how to heat shock yeast transformation mixtures"
end

take
  y = item yeast_transformation_mixtures
end

step
  description: "Heat shock yeast - plasmid mixture"
  note: "Place all the 1.5 mL tubes with yeast transformation mixtures into the heat block 42C for 15 min, location: B3.355."
  bullet: "Tubes should have the following id numbers: %{yeast_transformation_mixtures}."
  image: "heat_shock_yeast_transformation"
end

ii = 0

while ii < length(yeast_transformation_mixtures)
  modify
    y[ii]
    location:"B14.310"
    inuse:0
  end
  ii = ii + 1
end

step
  description: "Wait 15 minutes here"
  timer: { hours: 0, minutes: 15, seconds: 0 }
end
