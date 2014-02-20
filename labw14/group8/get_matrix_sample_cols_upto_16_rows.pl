argument
  
  samples: sample array, "Ingredients"
  row1: number array , "Amount in microliters for each ingredient, enter 0 for none"

end

# gather all errors ie not enough of a reagent
#  TODO allow it to be ordered or run protocol to make more of it

# take the number of samples of each ingredient needed
# depending on total amount used

# process the array and return

result = [ 
           [ {input: 1, microliters: 0.1}, {input: 2, amount: 2}],
           [ {input: 3, microliters: 0.3}, {input: 4, amount: 4}]
         ]

log
  return: { output: result}
end
