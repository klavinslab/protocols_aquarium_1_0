##makes a 50ml aliquot of 1M Tris-HCI ph7.5 solution

step
  description: "This protcol makes a 50ml bottle of 1M Tris-HCL pH7.5 solution."
end

take
  Tris_HCL= 1 "Tris-HCL"
  Tris_base= 1 "Tris-base"
  bottle = 1 "100 mL Bottle"
  MGh2o = 1 "Molecular Biology Grade Water"
end


step
  description: "Weigh out 6.35 g of Tris-HCL on the scale. Pour into the 100mL bottle." 
end

step
  description: "Weigh out 1.18 g of Tris-base. Pour into the 100mL bottle"
end

step
  description: "Fill up the 100mL bottle to 50mL with the molecular grade water."
end

step
  description: "Shake bottle until contents is dissolved."
end

produce
  r = 1 "Enzyme Buffer Stock" of "1M Tris-HCL, ph7.5"
  location: "Bench"
  release bottle
end


release Tris_HCL
release Tris_base 
release MGh2o

