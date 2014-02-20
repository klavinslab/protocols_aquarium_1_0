argument:
  number_of_fragments: number, "The number of fragments"
    # lang should aggregate unbound variables and have user give values
    # when schedule metacol
end

require "labw14/group8/lib_read_gibson.pl"

g = ask_filename_then_get_gibsons()

# idea TODO
# build up a data structure using loops etc that define experiment
# then iterate through that data structure, showing it
step
  description: "print out the gibson array"
  note: "%{g}"
end

log
  return: {gibsons: g, hash: {egkey: "egvalue"}}
end
