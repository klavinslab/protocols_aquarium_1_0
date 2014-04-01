argument
  fragments: sample array, "Fragment(s) to Gibson."
  volumes: number array, "Volumes of each fragment to add, one per fragment."
  group_n: number array, "How many fragments, in order, belong to each Gibson (e.g. 2 and 3 implies the first two fragments make one Gibson, the last 3 make another."
  products: string array, "The exact name of each plasmid that is being produced."
end

n = length(group_n)

# TODO: uniquify and deal with potential resulting issues in iterating over the fragments
take
  f = item fragments
  gibsons = n "Gibson Aliquot"
end

step
  description: "Label each Gibson aliquot temporarily"
  note: "Label each aliquot (from 1 through %{n}) on the side along with the current time."
end

ii = 0
total_count = 0
while ii < n
  vol_tot = 0
  aliquot = ii + 1

  jj = 0
  m = group_n[ii]
  while jj < m
    fragment = fragments[total_count]
    volume = volumes[total_count]
    vol_tot = vol_tot + volume

    step
      description: "Add %{volume} of %{fragment} to aliquot %{aliquot}"
      note: "Pipet %{volume} µL of %{fragment} into Gibson aliquot %{aliquot}."
    end

    jj = jj + 1
    total_count = total_count + 1
  end

  if vol_tot < 5.0
    vol_h2o = 5.0 - vol_tot
    step
      description: "Add %{vol_h2o} of water to aliquot %{aliquot}"
      note: "Pipet %{vol_h2o} µL of molecular grade water into Gibson aliquot %{aliquot}."
    end
  end

  ii = ii + 1
end

step
  description: "Place the Gibson aliquot(s) on a 50C heat block"
  note: "Put the aliquot(s) on the 50C heat block located in the back of bay B3."
end

step
  description: "Wait for 60 minutes"
  note: "The Gibson reaction take approximately 60 minutes to complete.\n\nAfter 60 minutes pass (use the timer below), hit 'Next'."
  warning: "Do NOT leave this page or the timer will reset. If you must leave the page, set your own timer for the time remaining."
  timer: {hours: 1, minutes: 0, seconds: 0}
end

kk = 0
while kk < n
  product = products[kk]
  gibson = gibsons[kk]
  produce
    plasmid = 1 "Gibson Reaction Results" of product
    release gibson
  end

  kk = kk + 1
end

release f
