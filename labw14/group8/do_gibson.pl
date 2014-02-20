#  last step
# return: {gibsons: g, hash: {egkey: "egvalue"}}

argument
  sample_concentrations: array, "the gibsons to do"
end

step
  description: "print out the gibson array"
  note: "%{sample_concentrations}"
end

log
  return: {sample_concentrations: sample_concentrations} # put resulting samples from produce here
end
