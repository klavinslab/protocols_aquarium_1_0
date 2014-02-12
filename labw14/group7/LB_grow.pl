argument
 cell_array: sample array, "The cells you want to study in the plate reader"
end

step
 description: "This protocol grows the cells of interest in the LB medium overnight (8+ hours)."
end

take
  cell_array = item cell_array
  #50mL tubes
  #LB media
end

step
  #
end

produce
 s = 1 "transformed E. Coli in 50%% glycerol" from cell_culture_tube[0]
 note: "Make sure to also add your initials and todays date (mm/dd/yyyy) in addition to the item ID number.
       This glycerol/cell culture mixture will potentially be stored in the -80 C freezer for many months,
       so be sure to label both the cap and the side of the tube for redundancy."
end

#release [cell_culture_tube[0], glycerol[0]]
release concat(cell_culture_tube, glycerol)
