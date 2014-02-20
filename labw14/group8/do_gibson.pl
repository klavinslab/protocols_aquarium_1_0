argument
  sample_concentrations: array, "the gibsons to do"
end

step
  description: "print out the gibson array"
  note: "%{sample_concentrations}"
end

log
  result: sample_concentrations # put resulting samples from produce here
end
