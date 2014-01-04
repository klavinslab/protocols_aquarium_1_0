argument
  e_coli_strain_id: sample, "The tube to be incubated."
  temp: number, "The temperature (in °C) at which to incubate the tube."
end

take
  y = item e_coli_strain_id
end

step
  description: "Put the tube in a small green tube holder and then place in the %{temp}°C incubator, location is B14.310."
end

modify
  y[0]
  location:"B14.310"
  inuse:0
end
