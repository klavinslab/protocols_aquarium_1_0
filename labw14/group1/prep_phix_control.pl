argument
  
  phix_lib : sample, "10 nM PhiX library"
  tris_cl : sample, "10 mM Tris-Cl, pH 8.5 with 0.1% Tween 20 "
  naoh : sample, "0.2 N NaOH"
  ht1 : sample, "Pre-chilled HT1"
  
end

step
  description: 
    "This protocol describes the process for preparing PhiX Control." 
end

take
  phix1 = item phix_lib
  tris1 = item tris_cl
end

step 
  description: "Create 4nM PhiX Library"
  check: "Pick a 1.5 mL tube and label it A."
  check: "Add 2 uL of the 10 nM PhiX library (part of the kit) to tube A."
  check: "Add 3 uL of 10 mM Tris-Cl, pH 8.5 with 0.1 %% Tween 20 (part of the kit) into tube A."
  note : "The tube now contains 4 nM PhiX Library"
end

take
  naoh1 = item naoh
  ht1_1 = item ht1
end

step 
  description: "Denature PhiX Control"
  check: "Pick a fresh 1.5 mL tube and label it B."
  check: "Add 5 uL of the 4 nM PhiX Library (created in the previous step, in tube A) to tube B."
  check: "Add 5 uL of 0.2 N NaOH to tube B."
  warning : "Make sure that 0.2 N NaOH is not more than 12 hrs old"
  note : "We now have a 2 nM PhiX Library Solution in the tube"
end

step

  check : "Vortex tube B briefly to mix the 2 nM PhiX library solution"
  check : "Centrifuge the solution (tube B) to 280 xg for 1 minute. Use the centrifuge B14.320 (use 300 xg)"
  check : "Incubate for 5 minutes at room temperature to denature the PhiX library into single strands"
  
end

step
  
  check : "Add 990 uL of Pre-chilled HT1 to the tube containing the denatured PhiX Library (tube B) prepared in the previous step"    
  note : "We now have 20 pM PhiX Library"
  
end

step

  description : "Dilute Denatured PhiX Control"
  check: "Pick a fresh 1.5 mL tube and label it C."
  check : "Add 375 uL of 20 pM denatured PhiX library (in tube B now) to the tube C."
  check : "Add 225 uL of Pre-chilled HT1 to tube C"
  check : "Invert multiple times to mix well"
  check : "Discard the remaining 0.2 N NaOH solution if it is not going to be used in the next 12 hrs".
  
end

produce

   ddPhiX = 1 "Diluted and Denatured PhiX Control"
   location: "Bench"
end

log
 return: {ddPhiX : ddPhiX}
end

tmp1 = concat(phix1,tris1)
tmp2 = concat(naoh1,ht1_1)
release concat(tmp1,tmp2)



