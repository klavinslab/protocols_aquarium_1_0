argument
  fragments: sample array, "Fragment(s) to Gibson."
  volumes: number array, "Volumes of each fragment to add, one per fragment."
  product: string, "The exact name of the plasmid that is being produced."
end

take
  f = item fragments
  gibson = 1 "Gibson Aliquot"
end

ii = 0
n = length(fragments)
while ii < n
  fragment = fragments[ii]
  volume = volumes[ii]

  step
    description: "Add %{volume} of %{fragment}"
    note: "Pipet %{volume} µL of %{fragment} into the Gibson aliquot."
  end

  ii = ii + 1
end

step
  description: "Place the Gibson aliquot on a 50C heat block"
  note: "Put the aliquot on the 50C heat block located in the back of bay B3."
end

step
  description: "Wait for 60 minutes"
  note: "The Gibson reaction take approximately 60 minutes to complete.\n\nAfter 60 minutes pass (use the timer below), hit 'Next'."
  warning: "Do NOT leave this page or the timer will reset. If you must leave the page, set your own timer for the time remaining."
  timer: {hours: 1, minutes: 0, seconds: 0}
end

produce
  plasmid = 1 "Gibson Reaction Results" of product
end
