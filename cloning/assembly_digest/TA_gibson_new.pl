argument
  #fragments: sample("Fragment") array, "Fragments in order of Gibsons"
  #gibson_pieces: number array, "The number of fragments (from the array above) going into each Gibson"
end


information "Scarlessly assemble DNA using fragments with terminal homologies."

include "cloning/assembly_digest/TA_gibson_input.pl"
  test_input=fragment_input
  test_conc=conc_input
end

step
  description: "This protocol prepares Gibson reactions in a strip-well tube."
end

num_gibs=length(gibson_pieces)

#two_d_arr = [[1,1],[2,2]]

#test_input = [["F1","F2"],["F3","F4"]]
#test_conc = [[2,2],[2,2]]

take
  my_frag_arr = item fragments
  master_mix = 1 "Gibson Aliquot"
end

x = length(test_input)

step
  description: "The first element in the array of hashes is %{test_input} the length of the thing is %{x}"
end

y = test_input[0][0]
z = test_conc[0][0]

step
  description: "BTW test_input[0][0] = %{z} uL of %{y} Grab a 12 strip-well PCR tube and cap, and rest it in a green PCR tube rack. With the numbers FACING YOU, do the following:"
  check: "Label the right most well with the letters DY"
  check: "Label the left most well with the letter A"
  note: "These wells will be refered to as 1 - 12"
end

if num_gibs > 12
  step
    description: "Grab a second 12 strip-well PCR tube and cap, and rest it in a green PCR tube rack. With the numbers FACING YOU, do the following:"
    check: "Label the right most well with the letters DY"
    check: "Label the left most well with the letter B"
    note: "These wells will be refered to as 13 - 24"
  end
end
if num_gibs > 24
  step
    description: "Grab a third 12 strip-well PCR tube and cap, and rest it in a green PCR tube rack. With the numbers FACING YOU, do the following:"
    check: "Label the right most well with the letters DY"
    check: "Label the left most well with the letter C"
    note: "These wells will be refered to as 25 - 36"
  end
end
if num_gibs > 36
  step
    description: "Grab a fourth 12 strip-well PCR tube and cap, and rest it in a green PCR tube rack. With the numbers FACING YOU, do the following:"
    check: "Label the right most well with the letters DY"
    check: "Label the left most well with the letter D"
    note: "These wells will be refered to as 37 - 48"
  end
end
if num_gibs > 48
  step
    description: "Grab a fourth 12 strip-well PCR tube and cap, and rest it in a green PCR tube rack. With the numbers FACING YOU, do the following:"
    check: "Label the right most well with the letters DY"
    check: "Label the left most well with the letter E"
    note: "These wells will be refered to as 49 - 60"
  end
end

#step
#  description: "Passed the test %{two_d_arr}"
#end

i = 0
j = 0

#while i < num_gibs

#  while j < num_gibs[i]
#    step
#      description: "Prepare Gibson %{i}"
#      note: "Add 2 µL"
#    end
#    j = j + 1
#  end
  
#  i = i + 1  
#end

release my_frag_arr
release master_mix

