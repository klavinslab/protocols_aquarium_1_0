argument
  Transformed_yeast_plate: sample, "A plate with yeast colonies"
end

take
  f
end

ii = 0

while ii < length(Transformed_yeast_plate)

  produce
      y = 1 "Overnight suspension culture" from plate[ii]
  end

end

log
  return: { yeast_overnight_suspension: y }
end
