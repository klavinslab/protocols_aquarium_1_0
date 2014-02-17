vol_data = []

n  = 1
ii = 0

while ii < n
  step
    description: "Type number"
    getdata
      num: number, "Number"
    end
  end
  
  vol_data = append(vol_data,num)

  nu = vol_data[0]

  step
    description: "Number: %{nu}"
  end
  
  ii = ii + 1
end

nu = vol_data[0]

step
  description: "Final values"
  note: "%{vol_data}"
  note: "%{nu}"
end
