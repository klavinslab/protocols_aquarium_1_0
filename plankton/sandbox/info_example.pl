argument
  fragments: sample array, "the fragments"
end

items = [ ] 

foreach f in fragments
  take
    x = item f
  end
  items = concat(items, x)
end

foreach i in items
  step
    description: "i = %{i}"
  end
  info_ret = info(i)
  step
    description: "show info"
    note: "%{info_ret}"
  end
end
