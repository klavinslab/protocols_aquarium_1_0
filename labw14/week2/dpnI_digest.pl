argument
  fragment: sample, "The purified fragment that needs to be digested"
end

take
  y = item fragment
end

step 
  description: "Add 1 µL of DpnI into the PCR result."
  note: "Gently mix with pipette tip."
end

modify
  y[0]
  location:"B14.310"
  inuse:0
end
