function incubate_small_tube(tube_sample_array, temp)
  foreach tube in tube_sample_array
    #tube_id = info(tube)[:id]
    tube_id = tube[:id]
    step
      description: "tube is %{tube}. Put the tube with id %{tube_id} in a small green tube holder."
      image: "green_tube_holder"
    end
    step
      description: "Place in the %{temp}°C incubator, location is B14.310."
      image: "put_green_tube_holder_to_incubator"
    end
  end
end

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
