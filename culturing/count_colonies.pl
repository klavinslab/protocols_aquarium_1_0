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
		y = item x
	end

	step
		description: "Image the plate with lid off."
		note: "Place the plate inverted on the transilluminator, take the lid off, put the camera hood on, turn on the transilluminator, and take a picture by centering around the plate.\n
		You need to set the camera at manual shooting mode by turning the dial until the M apppears, zoom in to center around the plate until the whole plate takes up the screen. Then click the flower button, choose macro. Set the shutter speed at 2 seconds, click the button with box on it, move the focus box to the edge of the plate and take the picture by holding the button half way down until you hear two beeps, then press it all the way down to take the picture."
	end

	step
		description: "Put the picture into software and get the count."
		note: "Wait several seconds for the picture uploading to Dropbox, open Dropbox/GelImages, under today's date folder, you will find the picture you just took.\n
		Open the OpenCFU software, drag the picture into the software and wait for the software to count the colonies"
	end
	step
		description: "Record the count."
		note: "If the software recognizes the coloines correctly and give a reasonbale count, record that number in below. If not, count the number of colonies by dividing up the plate in four regions, get the count in each region and sum up as the final count." 
		getdata
			count: number, "Enter the count you got from software or human counting."
		end
	end

	step
		description: "Store the plate in 4C fridge."
		note: "Turn off the transillumniator and camera, take the plate from transilluminator, wrap up the plate with parafilm and put it the in the fridge located at D2.100."
	end
	
	modify
 		y[0]
		location: "D2.100"
		inuse: 0
	end


	
	
