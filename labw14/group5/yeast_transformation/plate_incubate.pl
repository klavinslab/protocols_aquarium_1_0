argument
 transformed_yeast: sample array , "Yeast overnight suspension culture tube"
 yeast_plate_sterile: sample array
end

num = length(yeast_overnight_suspension)

step
 description: "This protocol describes how to incubate"
end

take
  transformed_yeast_tube = item transformed_yeast
  yeast_plate = yeast_plate_sterile
end

step
 description: "Put the Yeast out of the heat bath"
end

ii = 0
r  = []

while ii < length(yeast_overnight_suspension)

  produce
      y = 1 "Transformed Yeast Plate" from transformed_yeast_tube[ii]
      release transformed_yeast_tube[ii]
      release yeast_plate[ii]
  end
  
  r = append(r,y[:id])
  ii=ii+1
end

log
  return: { incubated_yeast_plate: r }
end

