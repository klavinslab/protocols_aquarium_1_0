step
	description: "Address System"
	note: "This protocol will introduce you to addressing system used in the lab."
	end


step
	description: "Address Format"
	note: "To the left, you can the format of a typical address in the lab.
	There are four distinct parts of this address. The first letter,
	the number that follows it, the first number after the period, and the last two numbers."
	image: "sample_address"
	end


step
	description: "The first character"
	note: "The first letter of the address corresponds the area of the lab where the item is located.
	\n If it's a B, the item is located in the main area of the laboratory, near the bays. \n
	If it's an A, the item is located in the gel room or room containing the dishwashing sink. \n
	If it's a D, the item is located at the back of the lab in the room containing the main freezers.
	\n These area distinctions are shown on the map to the left."
	image: "first_letter"
	end

step
	description: "The second character"
	note: "This number corresponds to the section of the first letter's area that the item occupies.\n
	In general, the numbers increase as you move clockwise around the A,B, or D area. The numbering 
	scheme can be seen in the photo to the left."
	image: "second_letter"
	end

step
	description: "The fourth character"
	note: "This number follows the period and is the height at which you will find the object.
	If an object is on the floor or in the lowest drawer, this number will  be a one. It then increases by one will every possible shelf, table top, drawer, or cabinet that
	an object could reside in. Table tops are generally a three. This numbering is displayed on the left."
	image: "third_letter"
	end

step
	description: "The fifth and sixth characters"
	note: "These two numbers correspond to right and left orientation within the section defined by the first two characters
	of the address. These numbers increase as you move right or clockwise. These numbers, when considered as one number, increment by fives."
	image: "fourth_letter"
	end

step
	description: "Practice using this system"
	note: "In the next section, you will be asked to find an address in the lab. 
		Walk to this location, note the color of the dot that is on or near it, and then return to the computer to submit your answer.  
		\n\nYou will fail this protocol if you enter two or more incorrect answers."
	end

numberWrong = 0
correct = 0
while correct == 0
	step
		description: "Go to B1.420"
		note: "Note the color of the dot on this location label."
		image: "Address1"
		getdata
		z: string, "What color was the dot?", ["purple", "red", "yellow", "blue" ]
		end
		end
		
	if z == "purple"
		correct = 1
	else
		step
			description: "That is incorrect"
			note: "Please return to B1.320 and answer again."
			end
		numberWrong = numberWrong + 1
	end
end

correct = 0
while correct == 0
	step
		description: "Go to B15.410"
		note: "Note the color of the dot on this location label."
		image: "Address2"
		getdata
		z: string, "What color was the dot?", ["purple", "red", "yellow", "blue" ]
		end
		end
		
	if z == "red"
		correct = 1
	else
		step
			description: "That is incorrect"
			note: "Please return to B15.510 and answer again."
			end
		numberWrong = numberWrong + 1
	end
end

correct = 0
while correct == 0
	step
		description: "Go to A8.315"
		note: "Note the color of the dot on this location label."
		image: "Address3"
		getdata
		z: string, "What color was the dot?", ["purple", "red", "yellow", "blue" ]
		end
		end
		
	if z == "yellow"
		correct = 1
	else
		step
			description: "That is incorrect"
			note: "Please return to A8.315 and answer again."
			end
		numberWrong = numberWrong + 1
	end
end

correct = 0
while correct == 0
	step
		description: "Go to B3.265"
		note: "Note the color of the dot on this location label."
		image: "Address4"
		getdata
		z: string, "What color was the dot?", ["purple", "red", "yellow", "blue" ]
		end
		end
		
	if z == "red"
		correct = 1
	else
		step
			description: "That is incorrect"
			note: "Please return to the B3.265 and answer again."
			end
		numberWrong = numberWrong + 1
	end
end

	if numberWrong > 1
		step
			description: "You have failed this protocol"
			note: "Your score is unsatisfactory. You will have to 
			retake this protocol."
			end
	else
		step
			description: "Congratulations!"
			note: "You have passed this protocol and should now
			have an understanding of the addressing system used in the lab."
			end
	end
end
