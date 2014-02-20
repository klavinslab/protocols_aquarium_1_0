argument
  gibsons: sample array, "the gibsons to verify"
end

step
  description: "print out the gibson array"
  note: "%{gibsons}"
end

log
  result: gibsons # put resulting samples from produce here
  failed_gibsons: gibsons # put failed gibsons here
end
