argument
  yeast_250ml_flask: sample array, "Diluted yeast culture"
end

num = length(yeast_250ml_flask)

step
  description: "This protocol describes how to make yeast competent cell aliquot"
  warning: "It is possible to make up to 6 aliquots out of one yeast suspension culture flask. 
        You will be asked on your desired number of aliquots later."
end

take
  description: "Get the following items"
  falcon_tube = num "50 mL Falcon Tube"
  flask = item yeast_250ml_flask
end

ii = 0
r = []

while ii < length(yeast_250ml_flask)

#  step
#    description: "You can make up to 6 aliquot tubes out of one 25ml yeast flask"
#    getdata
#      aliquot_number: number, "Desired number of aliquot tubes to make out of one 25ml flask"
#    end
#  end


  step
    description: "Harvest cells by centrifugation"
  end

  produce
      y = 1 "Yeast Competent Aliquot" from flask[ii]
      release flask[ii]
      note: "Write the above id number on the aliquot tube's side. Place on the bench."
      location:"Bench"      
  end
  
  r = append(r,y[:id])
  ii=ii+1
end

log
  return: { yeast_aliquot: r }
end

release falcon_tube
release flask
