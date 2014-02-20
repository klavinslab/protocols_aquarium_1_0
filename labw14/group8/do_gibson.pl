#  last step
# return: {gibsons: g, hash: {egkey: "egvalue"}}

argument
  sample_concentrations: sample array, "the gibsons to do" 
    # can i silently produce gibsons with data for the concentrations
    # then use that data to display to user what to do to make them?
    # then destroy / replace the fake items
end

step
  description: "print out the gibson array"
  note: "%{sample_concentrations}"
end

log
  return: {sample_concentrations: sample_concentrations} # put resulting samples from produce here
end
