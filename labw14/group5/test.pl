vol_data = []

n  = 2
ii = 0

while ii < n
  step
    description: "Type number"
    getdata
      num: number, "Number"
    end
  end
  
  vol_data[ii] = num
  
  step
    description: "Number: %{vol_data[ii]}"
  end
end
