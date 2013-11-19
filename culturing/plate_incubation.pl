argument
	x: sample, "Choose the plate to be incubated."
	tem: number, "Enter the temperature (in °C) at which to incubate the plate."
end

take
	y = item x
end

step
	description: "Put the plate in the %{tem}°C incubator, location is B14.310."
	note: "Incubate the plate upside-down (lid on the bottom) to prevent condensation from dropping on the agar surface."
	image: "put_plate_incubator"
end

modify
	y[0]
	location:"B14.310"
	inuse:0
end
