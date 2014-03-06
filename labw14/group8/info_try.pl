argument
  fragments: sample array, "the fragments"
end

items = [ ] 

foreach f in fragments
  take
    x = item f
  end
  items = append(items, x)
end

foreach i in items
  info_ret = info(i)
  step
    description: "show info"
    note: "%{info_ret}"
  end
end

    
