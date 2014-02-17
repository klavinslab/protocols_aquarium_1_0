vol_data = []

n  = 2
ii = 0

while ii < n
  step
    description: "Type number"
    getdata
      vol_data[ii]: number, "Number"
    end
  end
  
  step
    description: "Number: %{vol_data[ii]}"
  end
end
