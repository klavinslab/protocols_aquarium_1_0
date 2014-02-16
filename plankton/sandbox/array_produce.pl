argument
  ids: sample("Transformed E coli Strain") array, "Stocks"
end

take
  strains = item ids
end

result = []

foreach s in strains

  plasmid = info(s)[:field2]

  produce silently 
    p = 1 "Plasmid Stock" of plasmid
  end

  result = append(result,p[:id])

end

step
  description: "Result"
  note: "You made these new items: %{result}"
end

release strains
