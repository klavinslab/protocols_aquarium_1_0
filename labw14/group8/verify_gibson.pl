argument
  gibsons: sample array, "the gibsons to verify"
end

step
  description: "print out the gibsons to verify"
  note: "%{gibsons}"
end

log
  return: {successful: gibsons, failed: gibsons} # put new resulting samples from produce here
end
