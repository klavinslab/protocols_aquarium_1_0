#  last step
# return: {gibsons: g, hash: {egkey: "egvalue"}}

argument
  gibsons: sample array, "the gibsons to do" 
    # can i silently produce gibsons with data for the concentrations
    # then use that data to display to user what to do to make them?
    # then destroy / replace the fake items
end

step
  description: "print out the input gibson array"
  note: "%{gibsons}"
end

aborted_samples = [ ]

log
  return: {completed_samples: gibsons, aborted_samples: aborted_samples} # put resulting samples from produce here
end
