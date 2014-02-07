argument
  fragments: sample("Fragment") array, "Fragments in order of Gibsons"
  gibson_pieces: number array, "The number of fragments (from the array above) going into each Gibson"
  #fragment1: sample, "Fragment you are using"
end


information "Scarlessly assemble DNA using fragments with terminal homologies."

step
  description: "This protocol prepares Gibson reactions in a strip-well tube."
end

#l=length(fragments)

two_d_arr = [[1,1],[2,2]]

take
  my_frag_arr = item fragments
  master_mix = 1 "Gibson Aliquot"
end

step
  description: "Passed the test %{two_d_arr}"
end

release my_frag_arr
release master_mix

