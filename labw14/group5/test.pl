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
  
  vol_data = append(vol_data,num)
  
  step
    description: "Number: %{num}"
  end
end
