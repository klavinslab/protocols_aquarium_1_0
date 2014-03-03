#  last step
# return: {gibsons: g, hash: {egkey: "egvalue"}}

argument
  fragments: sample array "the fragments for the gibsons"
  gibsons: sample array, "the gibsons to do" 
    # can i silently produce gibsons with data for the concentrations
    # then use that data to display to user what to do to make them?
    # then destroy / replace the fake items
end

# show one screen in which all fragments are taken

step
  description: "Take fragments for Gibsons"
  note: "Go to the locations listed to take fragments for all the gibsons.
         Check old gibson protocols to see if they need to be kept on ice, etc."
end


step
  description: "print out the input gibson array"
  note: "%{gibsons}"
end

aborted_samples = [ ]

log
  return: {completed_samples: gibsons, aborted_samples: aborted_samples} # put resulting samples from produce here
end

# release fragments
