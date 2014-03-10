# use a function to get data entry by reading in a file that is a nested matrix?
# use a string to select the file 

# call this function in each protocol
# to get the gibson array
# since cannot pass complex arrays otherwise

function ask_filename_then_get_gibsons()
  step
    description: "Enter the filename with concentrations to use."
    note: "The path should look like labw14/group8/try_gibson.pl , ie, 
      it will automatically look in the protocols github repository.
      The file format is fragment_name1, fragment_name2, ... 
      for columns, then concentrations in microliters. Use blanks to indicate 
      not to use that fragment. A sample file is at labw14/group8/example_json_gibsons.json"
    warning: "This is currently ignored and the example file is used"
    getdata
      f: string, "The path to the file"
    end
  end
  
  # TODO get filename here working / retest with new version "%{f}"
  input
    p = "labw14/group8/example_json_gibsons.json"
  end


  return p
end

function add_short_labels_to_samples(samples, change_letter_ids)
  local test_ids = [1,2,3,4,5]
  local test_change_letter_id = [3,5]
  
  return "A1"
end

