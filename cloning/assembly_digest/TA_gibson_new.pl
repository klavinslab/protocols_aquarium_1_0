argument
  fragments: sample("Fragment") array, "Fragment Names"
end


information "Scarlessly assemble DNA using fragments with terminal homologies."

step
  description: "This protocol prepares Gibson reactions in a strip-well tube."
end

l=length(fragments)

x=0
take_num_arr=Array.new(l,1)

#take
#  frag_arr = 1 "Gibson Aliquot"
#end




step
  description: "Passed the test %{take_num_arr}."
end

