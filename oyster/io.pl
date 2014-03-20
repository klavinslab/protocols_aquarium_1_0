argument
  u: sample array
end

step
  description: "Got %{u}"
end

log
  return: { x: "dummy", y: [ 1, 2, 3 ] }
end
