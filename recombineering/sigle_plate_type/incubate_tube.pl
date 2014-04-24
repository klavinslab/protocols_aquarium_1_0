# Modified from existing protocol
argument
  e_coli_strain_id: sample array, "The tube to be incubated."
  temp: number, "The temperature (in °C) at which to incubate the tube."
end

take
  y = item unique(e_coli_strain_id)
end

step
  description: "Put the tubes in a small green tube holder."
        image: "green_tube_holder"
end

step
  description: "Place in the %{temp}°C incubator, location is A1.110."
        #image: "put_green_tube_holder_to_incubator"
end

foreach y_i in y
	modify
	  y_i
	  location:"A1.110"
	  inuse:0
	end
end
