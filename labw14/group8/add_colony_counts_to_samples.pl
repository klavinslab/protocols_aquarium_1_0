#  last step
# return: {gibsons: g, hash: {egkey: "egvalue"}}

argument
  colonies: sample array, "the colonies to image and save colony counts for"
end

step
  description: "print out the colony array"
  note: "%{colonies}"
end

step
  description: "here we'd like to modify the data on the existing samples"
  notes: "instead you can add the colony count to the sample manually, 
          we will put a screenshot here to guide you
          and we will verify the samples all have colony count values"
end

log
  return: {colonies: colonies} # put resulting samples from produce here
end
