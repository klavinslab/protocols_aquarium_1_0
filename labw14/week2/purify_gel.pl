argument
  Gel_Slice_id: sample, "Choose the Gel Slice you need to purify."
end

step
  description: "Weigh the gel slice on a scale"
  note: "Use a empty 1.5 mL tube to zero the scale first, then put the gel slice tube on the scale."
  getdata
    gel_weight: number, "Enter the gel slice weight shown on the scale in mg. If it shows 0.134 on scale, you enter 134 below."
  end
end

QG_volume = 3 * gel_weight
step
  description: "Add %{QG_volume} µL buffer QG into the gel slice tube with id %{Gel_Slice_id}."
end

step
  description: "Incubate the tube in a 50 C heat block for 10 minutes. Start a timer for it."
  note: "Vortex after 5 minutes incubation and put back in the 50 C until 10 minutes totoal time reached"
end

step
  description: "Take out the tube from 50 C heat blcok."
  note: "Place it on bench in a tube rack."
end

produce
  r = "Fragment Stock" of "pLAB3"
  location = "Bench"
end

log
  return: {Fragment_Stock_id: r[:id]}
end
