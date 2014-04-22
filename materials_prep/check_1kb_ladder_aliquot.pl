place make_1kb_ladder_aliquot
  protocol: "materials_prep/reagents/make_1kb_ladder_aliquot.pl"
  argument
    ladder: 2380
  end
  group: aquarium_user
  marked: true
  start: now()
  window: minutes(30)
end

transition [make_1kb_ladder_aliquot] => [make_1kb_ladder_aliquot] when error(0) || quantity({ object: “Ladder Aliquot”, sample: “1 kb Ladder” }) < 10 end
