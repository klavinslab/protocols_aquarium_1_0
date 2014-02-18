#argument
#  yeast_plasmid_mixture: sample array, "Mixture to transform"
#end

#num = length(yeast_plasmid_mixture)

step
 description: "This protocol describes how to heat shock the yeast mixture"
end

#take
#  mixture_tube = item yeast_plasmid_mixture
#end

step
  description: "Heat shock yeast - plasmid mixture"
  note: "Place all the 1.5mL tubes with yeast-plasmid mixtures into the heat block located at B3.355 for 15 min."
end

step
  description: "Wait 15 minutes here"
  timer: { hours: 0, minutes: 0, seconds: 15 }
end  
