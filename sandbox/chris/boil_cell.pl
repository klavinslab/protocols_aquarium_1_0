argument
  template: sample array, "liquied cultures from colonies"
end

take
  liquidtemplate = item template #an array
end

n_samp = length(template)
step
  description: "Take %{n_samp} tubes from a PCR tube strip and label them 1 through %{n_samp} on the side, also write your initials on it." 
end

step
  description: "Add 20 uL molecular grade water to each tube 1-%{n_samp}"
end

foreach t1 in template
  step
    description: "Take 1 uL from tube with id %{t1} and transfer it to tube 1"
  end
end

step
  description: "Place the tube 1-%{n_samp} into thermal cycler T2 at B3.335"
end

step
  description: "Choose program on the thermal cycler"
  check: "Click Home then click Saved Protocol, choose LABW14 folder, choose BOIL."
  check: "Close the lid and click start."
  check: "Choose 20 µL option."
  image: "thermal_cycler_home"
end
step
  description: "Wait for 5 minutes for the cells to boil."
  note: "if the program isn't done when the time is up just cancel/stop the program."
	timer: { hours: 0, minutes: 5, seconds: 0 }
end

step
  description: "Open the lid and take the %{n_samp} PCR tubes you placed."
  note: "Place tubes on your bench, these tubes will be used as your boiled cell for the following reaction setup."
end
#produces 4 templates.  each template has 3 primers and 2 reactions (f+r1,f+r2)

foreach t in liquidtemplate 
  modify
    t
    location: "DFS0"
  end
end

release liquidtemplate


