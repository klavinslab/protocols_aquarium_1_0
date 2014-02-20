function gibson_data()
  # ? : may want to take the samples here automatically
  local ingredients =
       ["frag1", "frag2", "frag3", "frag4", "frag5", "frag6", "frag7", "frag8", "frag9"],

  local outputs =
    [
       [      0,       0,       0,       0,       0,       0,       0,       0,       0],
       [      0,       0,       0,       0,       0,       0,       0,       0,       0],
       [      0,       0,       0,       0,       0,       0,       0,       0,       0],
       [      0,       0,       0,       0,       0,       0,       0,       0,       0],
       [      0,       0,       0,       0,       0,       0,       0,       0,       0]
     ]
  
  local totals_per_ingredient = [ ]
  
  # TODO look into inventory and check that enough of each fragment exists for the gibsons
  i = 0
  foreach frag in frags
    total_amount_in_microliters = 0
    foreach o in outputs
      total_amount_in_microliters = total_amount_in_microliters + o[i]
    end
    
    totals_per_ingredient = append(totals_per_ingredient, total_amount_in_microliters)
    i=i+1
  end
  
  local gibsons = [ ]
  gibsons = append ( gibsons, ingredients )
  foreach o in outputs
    gibsons = append ( gibsons, o )
  end
  
  return gibsons
  
end
