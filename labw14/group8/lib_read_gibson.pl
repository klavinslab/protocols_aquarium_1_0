# use a function to get data entry by reading in a file that is a nested matrix?
# use a string to select the file 

# call this function in each protocol
# to get the gibson array
# since cannot pass complex arrays otherwise

function ask_filename_then_get_gibsons()
  local f = "" #"labw14/group8/example_gibson_data.pl"
  step
    description: "Enter the filename with concentrations to use."
    note: "The path should look like labw14/group8/try_gibson.pl , ie, 
      it will automatically look in the protocols github repository.
      The file format is fragment_name1, fragment_name2, ... 
      for columns, then concentrations in microliters. Use blanks to indicate 
      not to use that fragment. A sample file is at labw14/group8/example_gibson_data.pl"
    getdata
      f: string, "The path to the file"
    end
  end
  
  #require "labw14/group8/example_gibson_data.pl" # placeholder for variable gibson input
  require "%{f}" # bug doesn't insert string or might not have val for f
  
  local r = gibson_data()
    # gibsons would look like gibsons = [
    #        ["frag1", "frag2", "frag3", "frag4",...],
    #        [      1,       2,       0,      0, ...],
    #        [ .... ],
    #        ]
  
  # transform array to nicer format for use by other programs
  
  # for now we just fake some data for testing
  local result = [ [{input: 1, concentration: 0.1}, {input: 2, concentration: 0.2}],
             [{input: 3, concentration: 0.3}, {input: 4, concentration: 0.4}] ]
  return result
end

# returns 
# [
#  [
#   {input: sample1, concentration: in_uL}, ...
#  ],
#  [ # second gibson
#   {input: sample2, concentration: in_uL}, ...
#  ],
#  
# ]
