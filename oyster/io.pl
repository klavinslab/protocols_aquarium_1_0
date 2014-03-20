argument
  u: sample array
end

step
  description: "Got %{u}"
end

z = [ 1, 2, 3 ]

log
  return: { x: "dummy", y: z }
end
