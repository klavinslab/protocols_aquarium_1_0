argument
  plate_ids: sample array
end

step
  description: "Got %{plate_ids}"
end

z = [ 1, 2, 3 ]

log
  return: { x: "dummy", plate_ids: z }
end
