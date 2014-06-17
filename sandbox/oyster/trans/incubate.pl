argument
  e_coli_strain_id: sample, "The plate to be incubated."
  temp: number, "The temperature (in °C) at which to incubate the plate."
end

take
  y = item e_coli_strain_id
end

step
  description: "Put the plate in the %{temp}°C incubator, location is B14.310."
  note: "Incubate the plate upside-down (lid on the bottom) to prevent condensation."
  image: "put_plate_incubator"
end

modify
  y[0]
  location:"B14.310"
  inuse:0
end
