argument
  e_coli_strain_id: sample, "The first plate to be incubated."
#  e_coli_strain_id_2: sample, "The second plate to be incubated"
  temp: number, "The temperature (in °C) at which to incubate the plate."
end

take
  y1 = item e_coli_strain_id
#  y2 = item e_coli_strain_id_2
end

step
  description: "Put the plates in the %{temp}°C incubator, location is B14.310."
  note: "Incubate the plates upside-down (lid on the bottom) to prevent condensation."
  image: "put_plate_incubator"
end

modify
  y1[0]
  location:"B14.310"
  inuse:0
end

