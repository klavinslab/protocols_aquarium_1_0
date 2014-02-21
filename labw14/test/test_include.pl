require "labw14/test/test_function_module.pl"

argument
  tube_array: sample array, "The small tube to be incubated."
#  e_coli_strain_id_2: sample, "The second plate to be incubated"
  temp: number, "The temperature (in °C) at which to incubate the plate."
end

take
  tube_sample_array = item tube_array
end

step
  description: "tube_sample_array is %{tube_sample_array}"
end

incubate_small_tube(tube_sample_array, temp)
