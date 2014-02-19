argument
  tube_id: sample, "The small tube to be incubated."
#  e_coli_strain_id_2: sample, "The second plate to be incubated"
  temp: number, "The temperature (in °C) at which to incubate the plate."
end

take
  y = item tube_id
end

function incubate_small_tube(tube_id, temp)
  step
    description: "Put the tube with id %{tube_id} in a small green tube holder."
	  image: "green_tube_holder"
  end
  step
    description: "Place in the %{temp}°C incubator, location is B14.310."
	  image: "put_green_tube_holder_to_incubator"
  end
end

incubate_small_tube(tube_id, temp)



function cleanup(msg1, msg2)
  step
    description: "Clean up your workstation"
    note: "%{msg1}"
  end
  step
    description: "Replace empty tip boxes with new tip boxes."
    note: "%{msg2}"
  end
end

cleanup("Leave it cleaner than you found it", "Put empty boxes on bench where it says empty boxes")
