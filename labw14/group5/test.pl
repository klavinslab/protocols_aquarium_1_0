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
  
  step
    description: "Number: "
  end
  
  ii = ii + 1
end

step
  description: "Final values"
  note: "%{vol_data}"
  note: "%{vol_data[0]}"
end
