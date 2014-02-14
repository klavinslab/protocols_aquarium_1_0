argument
  yeast_250ml_flask: sample array, "Diluted yeast culture"
end

num = length(yeast_250ml_flask)

step
  description: "This protocol describes how to make yeast competent cell aliquot"
end

step
  description: "You can make up to 6 aliquot tubes out of one 25ml yeast flask"
  getdata
    aliquot_number: number, "Desired number of aliquot tubes to make out of one 25ml flask"
  end
end

take
  falcon_tube = num "50 mL Falcon Tube"
  flask = item yeast_250ml_flask
end

ii = 0
r = []

while ii < length(Transformed_yeast_plate)

  produce
      y = 1 "Yeast aliquot" from flask[ii]
  end
  
  r = append(r,y[:id])
  ii=ii+1
end

log
  return: { yeast_aliquot: r }
end

release falcon_tube
release flask
