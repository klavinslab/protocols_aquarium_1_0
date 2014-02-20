# use a function to get data entry by reading in a file that is a nested matrix?
# use a string to select the file 

# call this function in each prootocol
# to get the gibson array
# since cannot pass complex arrays otherwise

function get_gibson_csv_path_return_gibsons()
  step
    description: "Enter the filename with concentrations to use."
    note: "The path should look like labw14/group8/try_gibson.pl , ie, 
      it will automatically look in the protocols github repository.
      The file format is fragment_name1, fragment_name2, ... 
      for columns, then concentrations in microliters. Use blanks to indicate 
      not to use that fragment. A sample file is at  labw14/group8/sample_gibson_spec.csv"
    getdata
      f: string, "The path to the file"
    end
  end
  include "%{f}"
    r = gibsons
    # gibsons would look like gibsons = [
    #        ["frag1", "frag2", "frag3", "frag4",...],
    #        [      1,       2,       0,      0, ...],
    #        [ .... ],
    #        ]
  end
  
  # transform array to nicer format for use by other programs
  
  # for now we just fake some data for testing
  result = [ [{input: 1, concentration: 0.1}, {input: 2, concentration: 0.2}],
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
