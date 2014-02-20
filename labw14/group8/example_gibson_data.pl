  # ? : may want to take the samples here automatically
  
  # types of the gibsons you want to do
  # create these via spreadsheet import if they don't already exist
  local ingredients =
       ["frag1", "frag2", "frag3", "frag4", "frag5", "frag6", "frag7", "frag8", "frag9"]

  # amounts of each fragment to add per 
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
  foreach ing in ingredients
    total_amount_in_microliters = 0
    foreach o in outputs
      total_amount_in_microliters = total_amount_in_microliters + o[i]
    end
    
    totals_per_ingredient = append(totals_per_ingredient, total_amount_in_microliters)
    i=i+1
  end
  
  # idea
  # require std_lib.pl
  # have_enough(ingredients, totals_per_ingredient) # probably should use hashes instead?
  # I may be thinking too obj oriented about this. TODO ask Eric about error and inv handling
  
  # sidenote: I think too much in metaprogramming
  # ideas like steps.reduce(human_execute, ingredients)
  
  gibsons = [ ] # wanted to do hash with ingredients and gibsons keys; hard to pass hashes in oyster
  gibsons = append ( gibsons, ingredients )
  foreach o in outputs
    gibsons = append ( gibsons, o )
  end
  
log
  output: gibsons
end
  

