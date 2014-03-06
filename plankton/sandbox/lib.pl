function produce_minipreps(strains)

  local result = []
  local p

  foreach s in strains

    plasmid = info(s)[:field2]

    produce silently 
      p = 1 "Plasmid Stock" of plasmid
    end

    result = append(result,p[:id])

  end

  return result

end
