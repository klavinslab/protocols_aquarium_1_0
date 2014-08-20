argument
  yeast_overnight_ids: sample ("Yeast Strain") array, "Choose the culture to release" 
end

take
  yeast_overnights = item yeast_overnight_ids
end

release yeast_overnights
