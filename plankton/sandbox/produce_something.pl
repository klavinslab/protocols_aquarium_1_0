argument
  x: sample
end

take
  gc = item x
end

produce
  y = 1 "Glycerol Stock" from gc[0]
end

release gc
