#information "This protocol is a teaching tool for locating safety items in the laboratory."

class Protocol
  def main
  	show {
  		title "Directions:"
  		note "In each step, you will be asked to find an item in the lab. A picture of the item and a map, with the item's location marked by a yellow dot, are provided. Walk to the location the item, note the color of the dot that is on or near it, and then return to the computer to submit your answer"
  		warning "You will fail this protocol if you enter two or more incorrect answers."
  	}
  
  	$task = 0
  	$numberWrong = 0
  	
  	while $task == 0 do
    	sharps_data = show {
    		title "Where is the sharps container?"
    		note "Its location is B15.215. \nPlease go to the sharps container, note the color of the dot that is on or near it, and then return to the computer. 
    		\n\nWhat color was the dot associated with the sharps container?"
    		image "Sharps_Container"
    		select [ "purple", "green", "yellow", "blue"], var: "choice", label: "Please select the correct color", default: 1
    	}
      sharps_choice = sharps_data[:choice]
    
    	if sharps_choice == "green"
    	  show {
    	    $task = 1
    			title "That is correct! "
    			note "You have successfully located the sharps container which is used for the disposal of sharp items in the lab."
    		}
     	else
    	  show {
    			title "That is incorrect."
    			note "Please return to the sharps container and then answer again."
    			image "Sharps_Container"
    		}
    		$numberWrong = $numberWrong + 1
    		status = 'Fail - sharps container'
    		return status
    	end
    end

   	$task = 0
    
    while $task == 0 do
     	fireext_data = show {
     		title "Where is the fire extinguisher located? "
     		note "Its location is B16.100. \nLocate the fire extinguisher, note the color of the dot that is on or near it, and then return to the computer. 
     		\n\nWhat color was the dot associated with the fire extinguisher?"
     		image "Fire_Extinguisher"
        select [ "purple", "green", "yellow", "blue"], var: "choice", label: "Please select the correct color", default: 1
     	}
      fireext_choice = fireext_data[:choice]
  
     	if fireext_choice == 'blue'
   			$task = 1
   			show {
   				title "That is correct!"
   				note "You have successfully located the fire extinguisher which is used for putting out fires. "
   			}
      else
   			show {
   				title "That is incorrect."
   				note "Please return to the fire extinguisher and then answer again."
   				image "Fire_Extinguisher"
   			}
   		  $numberWrong = $numberWrong + 1
   			status = 'Fail - fire extinguisher'
   			return status
    	end
    end
    
    $task = 0
    
    while $task == 0 do
     	eyewash_data = show {
    		title "Where is the shower and eyewash station? "
     		note "Its location is A3.515. \nPlease go to the shower and eyewash station, note the color of the dot that is on or near it, and then return to the computer. 
     		\n\nWhat color was the dot associated with the shower and eyewash station?"
     		image "shower-eyewash"
       	select [ "purple", "green", "yellow", "blue"], var: "choice", label: "Please select the correct color", default: 1
     	}
    	eyewash_choice = eyewash_data[:choice]
      
      if eyewash_choice == 'yellow'
      	$task = 1
      	show {
      		title "That is correct! "
      		note "You have successfully located the shower and eyewash station which is used to cleanse your eyes or person in case you come in contact with hazardous chemicals or fire. "
      	}
      else
      	show {
      		title "That is incorrect."
      		note "Please return to the shower and eyewash station and then answer again."
      		image "shower-eyewash"
      	}
      	$numberWrong = $numberWrong + 1
      	status = 'Fail - Shower and Eyewash'
      	return status
      end
    end
    
    $task = 0
    
    while $task == 0 do
     	fumehood_data = show {
    		title "Where is the fume hood? "
    		note "Its location is A5.615. \nPlease go to the fume hood, note the color of the dot that is on or near it, and then return to the computer. 
    		\n\nWhat color was the dot associated with the fume hood?"
    		image "Fume_Hood"
        select [ "purple", "green", "yellow", "blue"], var: "choice", label: "Please select the correct color", default: 1
      }
      fumehood_choice = fumehood_data[:choice]
    
     	if fumehood_choice == 'yellow'
    		$task = 1
    		show {
    			title "That is correct! "
    			note "You have successfully located the fume hood which is used limit exposure to hazardeous fumes."
    		}
  		else
      	show {
    			title "That is incorrect."
    			note "Please return to the fume hood and then answer again."
    			image "Fume_Hood"
    		}
    		$numberWrong = $numberWrong + 1
    		status = 'Fail - Fume Hood'
    	 	return status
    	end
    end
    
    $task = 0
    
    while $task == 0 do
    	hsink_data = show {
    		title "Where is the handwashing sink? "
    		note "Its location is B2.315. \nPlease go to the handwashing sink, note the color of the dot that is on or near it, and then return to the computer. 
    		\n\nWhat color was the dot associated with the handwashing sink?"
    		image "handwashingsink"
      	select [ "purple", "green", "yellow", "blue"], var: "choice", label: "Please select the correct color", default: 1
      }
      hsink_choice = hsink_data[:choice]
    
    	if hsink_choice == 'purple'
    		$task = 1
    		show {
    			title "That is correct! "
    			note "You have successfully located the sink used for washing your hands."
    		}
			else
     		show {
    			title "That is incorrect."
    			note "Please return to the handwashing sink and then answer again."
    			image "handwashingsink"
    		}
    		$numberWrong = $numberWrong + 1
    		status = 'Fail - handwashing sink'
    		return status
    	end
    end
  
	 $task = 0
  
  	while $task == 0 do
  		biohaz_data = show {
  			title "Where are the biohazard boxes? "
  			note "Their location is B15.400. \nPlease go to the biohazard boxes, note the color of the dot that is on or near them, and then return to the computer. 
  			\n\nWhat color was the dot associated with the biohazard boxes?"
  			image "Biohazard_Box"
      	select [ "purple", "green", "yellow", "blue"], var: "choice", label: "Please select the correct color", default: 1
      }
     	biohaz_choice = biohaz_data[:choice]
  
	    if biohaz_choice == 'blue'
	    	$task = 1
	    	show {
	    		title "That is correct! "
	    	  note "You have successfully located one of the biohazard boxes which are used for disposing of biohazardous materials."
	    	}
	    else
	    	show {
	    		title "That is incorrect."
	    		note "Please return to the biohazard boxes and then answer again."
	    		image "Biohazard_Box"
	    	}
    		$numberWrong = $numberWrong + 1
    		status = 'Fail - Biohazard boxes'
    		return status
    	end
  	end
  
  	$task = 0
  
  	while $task == 0 do
    	dsink_data = show {
    		title "Where is the dishwashing sink? "
    		note "Its location is A8.315. \nPlease go to the dishwashing sink, note the color of the dot that is on or near it, and then return to the computer. 
    		\n\nWhat color was the dot associated with the dishwashing sink?"
    		image "dishwashingsink"
        select [ "purple", "green", "yellow", "blue"], var: "choice", label: "Please select the correct color", default: 1
      }
      dsink_choice = dsink_data[:choice]
  
  		if dsink_choice == 'green'
				$task = 1
				show {
					title "That is correct! "
					note "You have successfully located the sink which is used for washing dishes."
				}
			else
				show {
					title "That is incorrect."
					note "Please return to the dishwashing sink and then answer again."
					image "dishwashingsink"
				}
				$numberWrong = $numberWrong + 1
				status = 'Fail - Dishwashing sink'
				return status
  		end
		end
  
  	$task = 0
  
  	while $task == 0 do
    	glove_data = show {
    	  title "Where are the latex gloves? "
    	  note "Their location is B14.320. \nPlease go to the latex gloves, note the color of the dot that is on or near them, and then return to the computer. 
    	  \n\nWhat color was the dot associated with the latex gloves?"
    	  image "latexgloves"
        select [ "purple", "green", "yellow", "blue"], var: "choice", label: "Please select the correct color", default: 1
      }
      glove_choice = glove_data[:choice]
    
    	if glove_choice == 'purple'
  			$task = 1
  			show {
  				title "That is correct! "
  				note "You have successfully located the latex gloves which are used protect your hands from hazardous substances in the lab."
  			}
  		else
  			show {
  				title "That is incorrect."
  				note "Please return to the latex gloves and then answer again."
  				image "latexgloves"
  			}
  			$numberWrong = $numberWrong + 1
  			status = 'Fail - Latex Gloves'
  			return status
    	end
  	end
  
  	$task = 0
  
  	while $task == 0 do
  	  hotgloves_data = show {
  		  title "Where are the heat resistant gloves? "
  		  note "Their location is B15.320. \nPlease go to the heat resistant gloves, note the color of the dot that is on or near them, and then return to the computer. 
  		  \n\nWhat color was the dot associated with the heat resistant gloves?"
  		  image "Heat_Resistance_Gloves"
        select [ "purple", "green", "yellow", "blue"], var: "choice", label: "Please select the correct color", default: 1
      }
      hotgloves_choice = hotgloves_data[:choice]
  
    	if hotgloves_choice == 'yellow'
    		$task = 1
    		show {
    			title "That is correct! "
    			note "You have successfully located the heat resistant gloves which are used when handling hot objects in the lab."
    		}
    	else
    		show {
    			title "That is incorrect."
    			note "Please return to the heat resistant gloves and then answer again."
    			image "Heat_Resistance_Gloves"
    		}
    		$numberWrong = $numberWrong + 1
    		status = 'Fail - Heat Resistant Gloves'
    		return status
    	end
    end
  
  	$task = 0
  
  	while $task == 0 do
    	towel_data = show {
  		  title "Where are the paper towels? "
  		  note "Their location is B15.520. \nPlease go to the paper towels, note the color of the dot that is on or near them, and then return to the computer. 
  		  \n\nWhat color was the dot associated with the paper towels?"
  		  image "papertowels"
        select [ "purple", "green", "yellow", "blue"], var: "choice", label: "Please select the correct color", default: 1
      }
      towel_choice = towel_data[:choice]
  
    	if towel_choice == 'blue'
      	$task = 1
    		show {
    			title "That is correct! "
    			note "You have successfully located the paper towels in the lab."
    		}
    	else
    		show {
    			title "That is incorrect."
    			note "Please return to the paper towels and then answer again."
    			image "papertowels"
    		}
    		$numberWrong = $numberWrong + 1
    		status = 'Fail - Paper Towels'
    		return status
    	end
    end
  
  	$task = 0
  
  	while $task == 0 do
    	goggle_data = show {
  		  title "Where are the goggles? "
  		  note "Their location is B7.235. \nPlease go to the goggles, note the color of the dot that is on or near them, and then return to the computer. 
  		  \nThe goggles are in the drawer at the given location. 
  		  \n\nWhat color was the dot associated with the goggles?"
  		  image "goggles"
        select [ "purple", "green", "yellow", "blue"], var: "choice", label: "Please select the correct color", default: 1
      }
      goggle_choice = goggle_data[:choice]

    	if goggle_choice == 'purple'
        $task = 1
    		show {
    			title "That is correct! "
    			note "You have successfully located the goggles in the lab."
    		}
    	else
    		show {
    			title "That is incorrect."
    			note "Please return to the goggles and then answer again."
    			image "goggles"
    		}
    		$numberWrong = $numberWrong + 1
    		status = 'Fail - goggles'
    		return status
    	end
    end
  
  	$task = 0
  
  	while $task == 0 do
    	firstaid_data = show {
    		title "Where is the first aid kit? "
    		note "Its location is B7.500. \nPlease go to the first aid kit, note the color of the dot that is on or near them, and then return to the computer. 
    		\n\nWhat color was the dot associated with the first aid kit? "
    		image "first_aid_kit_with_map"
        select [ "purple", "green", "yellow", "blue"], var: "choice", label: "Please select the correct color", default: 1
      }
      firstaid_choice = firstaid_data[:choice]
  
    	if firstaid_choice == 'green'
  			$task = 1
    		show {
      		title "That is correct! "
    			note "You have successfully located the first aid kit in the lab."
    		}
    	else
    		show {
    			title "That is incorrect."
    			note "Please return to the first aid kit and then answer again."
    			image "first_aid_kit_with_map"
    		}
    		$numberWrong = $numberWrong + 1
    		status = 'Fail - first aid kit'
    		return status
    	end
    end
  
  	if $numberWrong > 1
  		show {
  			title "You have failed this protocol. "
  			note "Your score is unsatisfactory. You will have to retake this protocol. "
  		}
  		status = 'Fail'
  		return status
  	else
  		show { 
    		title "Congratulations! You have passed this protocol."
  		}
  		status = 'Pass'
  		return status
  	end
  	
  end
end
