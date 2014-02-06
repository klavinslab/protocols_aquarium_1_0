argument
  input_id: sample array, "Choose the plate"
end

take
  plate = item input_id
end

step
  description: "input_id is %{input_id}, plate is %{plate}"
end

ii = 0
r = []

while ii < length(input_id)
  produce
	  y = 1 "Overnight suspension culture" from plate[ii]
	end
  r = append(r,y[:id])
  ii = ii + 1
end

release plate

log 
  return: {output_id: r}
end

step
  description: "output_id is %{r}"
end

