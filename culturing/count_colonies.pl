	argument
		x: sample, "Choose the plate you incubated yesterday"
	end

	step
		description: "This protocol describes how to take a plate from an incubator and 
count number of colonies on the plate"
		note: "In this protocol you need to use camera to take picture
for the plate and use a software to process the image to get the count"
	end
	
	step
		description: "Take the plates out from the incubator"
	end

	step
		description: "Image the plate with lid off"
	end

	step
		description: "Put the picture into software and get the count"
		getdata
			x: number, "Enter the count you got from the software"
		end
	end


	
	
