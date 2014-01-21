argument
  fragment: sample,"The sample that you want to spec its concentration"
end

take
  y = item fragment
end


step
  description: "Initialize the Nanodrop"
end

step
  description: "Blank with buffer EB"
end

step
  description: "Add 2 μL of your sample with id %{fragment} to the nanodrop"
end

step
  description: "Record the concentration shown on the nanodrop computer"
  getdata
 	  conc: number,"Write down the number shown on the computer after ng/μL"
	end
end

release y


