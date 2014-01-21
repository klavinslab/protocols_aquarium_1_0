argument
  fragment: sample,"The sample that you want to spec its concentration"
end

take
  y = item fragment
end


step
  description: "Go the location B2.202, find the Nanodrop"
end

step
  description: "Add 2 μL of buffer EB on the Nanodrop, click Blank in the software"
end

step
  description: "Add 2 μL of your sample with id %{fragment} to the nanodrop and then click Measure in the software"
end

step
  description: "Record the concentration shown on the nanodrop computer"
  getdata
    conc: number,"Write down the number shown on the computer after ng/μL"
  end
end

release y


