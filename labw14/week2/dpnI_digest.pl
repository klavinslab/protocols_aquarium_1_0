argument
  PCR_Result_id: sample, "The PCR result from thermal cycler"
end

take
  y = item PCR_Result_id
end

step 
  description: "Add 1 µL of DpnI into the PCR result."
end

modify
  y[0]
  location:"Bench"
  inuse:0
end
