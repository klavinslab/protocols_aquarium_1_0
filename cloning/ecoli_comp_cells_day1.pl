information "Set up for making e.coli electrocompetent cells tomorrow."

argument
  e_coli_strain_type: object, "The electrocompetent E. coli aliquot type."
end

take 
  2 250mL flasks
  LB
end

step
  Label each flask with the strain name
end

step
  Add 50mL LB broth into each of the 2 250mL flasks using a serological pipette.
end


take
  strain = n e_coli_strain_type




step
  Innoculate each flask with cells from a glycerol stock
end

step
  Put both flasks into the 37 degree shaker incubator
end
