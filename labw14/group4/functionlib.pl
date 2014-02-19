# library of functions

# takes in an original sample id and a sample array and returns the id of the first descendent sample
function find_original( o_id, sample_array)
  foreach elem in sample_array
    local orig_id = elem[:data][:original_id]
    if o_id == orig_id
      return elem
    end
  end
end
