argument
  
  samples: sample array, "Ingredients"
  # could have a key argument here to set key, for now just say amount
  row1: number array , "Amount in microliters for each ingredient, enter 0 for none"
  row2: number array , "Amount in microliters for each ingredient, enter 0 for none"
  row3: number array , "Amount in microliters for each ingredient, enter 0 for none"
  row4: number array , "Amount in microliters for each ingredient, enter 0 for none"
  row5: number array , "Amount in microliters for each ingredient, enter 0 for none"
  row6: number array , "Amount in microliters for each ingredient, enter 0 for none"
  row7: number array , "Amount in microliters for each ingredient, enter 0 for none"
  row8: number array , "Amount in microliters for each ingredient, enter 0 for none"
  row9: number array , "Amount in microliters for each ingredient, enter 0 for none"
  row10: number array , "Amount in microliters for each ingredient, enter 0 for none"
  row11: number array , "Amount in microliters for each ingredient, enter 0 for none"
  row12: number array , "Amount in microliters for each ingredient, enter 0 for none"
  row13: number array , "Amount in microliters for each ingredient, enter 0 for none"
  row14: number array , "Amount in microliters for each ingredient, enter 0 for none"
  row15: number array , "Amount in microliters for each ingredient, enter 0 for none"
  row16: number array , "Amount in microliters for each ingredient, enter 0 for none"
end

# gather all errors ie not enough of a reagent
#  TODO allow it to be ordered or run protocol to make more of it

# take the number of samples of each ingredient needed
# depending on total amount used

# process the array and return
if length(row2) > 0
  log
    gt0: 1
  end
end

result = [ 
           [ {input: 1, microliters: 0.1}, {input: 2, amount: 2}],
           [ {input: 3, microliters: 0.3}, {input: 4, amount: 4}]
         ]

log
  return: { output: result}
end
