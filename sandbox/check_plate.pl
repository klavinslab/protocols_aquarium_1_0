argument
  plates: sample array, "plates"
end

take
  p = item plates
end

diameters = []
cnts = []
foreach pp in p
  ii = pp[:id]
  step
    description:  "Look at the plate %{ii}."
    getdata
      d: number, "Estimate the average colony size in millimeters. (eg 0.5, 1, 1.5 ...).  Enter 0 if there are no colonies."
      n: number, "Estimate the number of colonies. (eg 0, 1, 10, 50, 100 ...)"
    end
  end
  diameters = append(diameters,d)
  cnts = append(cnts,n)
  if d > 0.9
    step
      description: "wrap plate %{ii} in parafilm"
    end
    modify
      pp
      location: "DFP.5"
    end
  end
end

log
  diameters: diameters
  cnts: cnts
end

step
  description: "NOTE: pay special attention to the location in the next step as it may have changed"
end

release p
