##This protocol makes 1ml of 5X ISO Buffer

step
  description: "This protocol makes 3 320µl aliquots of 5X ISO Buffer used for creating gibson aliquots"
end

take
  Tris_HCL= 1 "1M Tris-HCL, ph7.5"
  mgcl2= 1 "2M MgCl2"
  dGTP= 1 "100 mM dGTP"
  dATP= 1 "100mM dATP"
  dTTP= 1 "100mM dTTP"
  dCTP= 1 "100mM dCTP"
  DTT= 1 "1M DTT"
  NAD= 1 "100mM NAD"
  peg= 1 "PEG 8000"
  MGh2o = 1 "Molecular Biology Grade Water"
end

step
  description:"Grab a 1.5ml eppendorf tube and add 500 μl of 1 M Tris-HCl pH 7.5"
end

step
  description:"Add 25 μl of 2M MgCl2 to the tube"
end

step
  description:"Add 10 μl of 100 mM dGTP to the tube"
end

step
  description:"Add 10 μl of 100 mM dATP to the tube"
end

step
  description:"Add 10 μl of 100 mM dTTP to the tube"
end

step
  description:"Add 10 μl of 100 mM dCTP to the tube"
end

step
  description:"Add 50 μl of 1M DTT to the tube"
end

step
  description:"Add 50 μl of 100 mM NAD to the tube"
end

step
  check:"go to the scale and carefully weigh out 0.25 g PEG-8000"
  check:"Gently add the 0.25g PEG-8000 to the tube"
end

step
  description: "Add 100 μl of Molecular Grade Water to the tube"
end

step
  description: "Cap the tube and gently vortex the tube until the PEG is dissolved"
end

step
  check: "Grab three new 1.5 ml tubes"
  check: "Pipette 320µl of the 1ml mixure into each of the three newly acquired tubes."
end

produce
  r = 3 "5X ISO Buffer"
  location: "Bench"
end

release [ Tris_HCL[0], mgcl2[0], dGTP[0], dTTP[0], dATP[0], dGTP[0], DTT[0], NAD[0], peg[0],MGh2o[0] ]
