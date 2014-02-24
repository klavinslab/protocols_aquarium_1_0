# library of functions

# takes in an original sample id and a sample array of hashes and returns the first descendent sample as a hash
function find_original( o_id, sample_array)
  foreach elem in sample_array
    if o_id == elem[:data][:original_id]
      return elem
    end
  end
end

# wrapper function so unique works in oyster language
function unique(a)
	return unique(a)
end
