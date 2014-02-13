argument
  yeast_250ml_flask: sample array, "Diluted yeast culture"
end

num = length(yeast_250ml_flask)

step
 description: "This protocol describes how to make competent yeast cells"
 warning: "You're going to make %{num} overnight suspension tubes"
end

take
  falcon_tube = num "50 mL Falcon Tube"
  flask = item yeast_250ml_flask
end

ii = 0
r = []

while ii < length(Transformed_yeast_plate)

  produce
      y = 1 "Yeast aliquot"
  end
  
  r = append(r,y[:id])
  ii=ii+1
end

log
  return: { yeast_aliquot: r }
end

release concat(falcon_tube, flask)
