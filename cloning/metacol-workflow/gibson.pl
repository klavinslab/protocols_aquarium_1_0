argument
  fragments: sample array, "Fragment(s) to Gibson."
  volumes: number array, "Volumes of each fragment to add, one per fragment."
  group_n: number array, "How many fragments, in order, belong to each Gibson (e.g. 2 and 3 implies the first two fragments make one Gibson, the last 3 make another."
  products: string array, "The exact name of each plasmid that is being produced."
  aliquot_id: number, "The ID of the gibson aliquot box. Enter 0 if you don't need comp cells from a specific batch."
end

n = length(group_n)

step
  description:"Which aliquots."
  note: "In the following take, pay careful attention and look for the ID of the box of gibson aliquots to take from. If it is 0, then the batch number doesn't matter. If it's any other ID number grab all aliquots from the Gibson aliquot box with that ID."
end

take
  f = item unique(fragments)
  gibsons = n "Gibson Aliquot"
  note: "Take all Gibson aliquots from box with ID %{aliquot_id}"
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
gibson_reaction_result_ids=[]
while kk < n
  product = products[kk]
  gibson = gibsons[kk]
  produce
    plasmid = 1 "Gibson Reaction Result" of product
    release gibson
  end

  gibson_reaction_result_ids = append(gibson_reaction_result_ids,plasmid[:id])

  kk = kk + 1
end

release f

log
  return: {gibson_reaction_result_ids: gibson_reaction_result_ids}
end

