argument
  yeast_tube_id: sample, "Choose the tube you intended to do dispose"
end

take
  yeast_tube = item yeast_tube_id
step
  description: "Choose to dispose the tube in the release step"
end

release yeast_tube[0]
