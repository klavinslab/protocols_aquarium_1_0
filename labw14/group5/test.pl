vol = []

while ii < 2

  step
  description: "number?"
    getdata
      n: number
    end
  end
  
  ii = ii + 1
  vol = append (vol,n)
end

num = vol[0]

step
  description: "%{num}"
end
