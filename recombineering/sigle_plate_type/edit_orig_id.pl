argument
  e_coli: sample array, "Strain to set data to"
end

take
  samp = e_coli
end

i = 0
while i < length(e_coli)
  modify
    samp[i]
    data
      original_id: e_coli[i]
    end
  end
end
