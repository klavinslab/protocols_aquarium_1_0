	argument
		x: sample, "Choose the plate you incubated yesterday"
	end

	step
		description: "This protocol describes how to take a plate from an incubator and 
count number of colonies on the plate."
		note: "In this protocol you will use gel station camera to take a picture
for the plate and use a software on the plate reader computer to process the image to get the count of colonies."
	end
	
	take
		item x
	end

	step
		description: "Image the plate with lid off."
		note: "Place the plate inverted on the transilluminator, take the lid off, put the camera case on and take a picture by centering around the plate."
	end

	step
		description: "Put the picture into software and get the count."
		note: "Wait several seconds for the picture uploading to Dropbox, open Dropbox/GelImages, under today's date file, you will find the picutre you just took.\n
		Open the software, drag the picture into the software and wait for the software to count the colonies"
		getdata
			x: number, "Enter the count you got from the software."
		end
	end


	
	
