#information "This protocol is a teaching tool for locating safety items in the laboratory."

class Protocol
  def main
    show {
      title "Directions:"
      note "In each step, you will be asked to find an item in the lab. A picture of the item and a map, with the item's location marked by a yellow dot, are provided. Walk to the location the item, note the color of the dot that is on or near it, and then return to the computer to submit your answer"
      warning "You will fail this protocol if you enter two or more incorrect answers."
    }

    objects = [ { name: "sharps container", location: "B15.215", color: "green", imgfile: "Sharps_Container", default: 2, plural: 1, status: "" },
                { name: "fire extinguisher", location: "B16.100", color: "blue", imgfile: "Fire_Extinguisher", default: 4, plural: 1, status: "" },
                { name: "shower/eyewash station", location: "A3.515", color: "yellow", imgfile: "shower-eyewash", default: 3, plural: 1, status: "" },
                { name: "sharps container", location: "B15.215", color: "green", imgfile: "Sharps_Container", default: 2, plural: 1, status: "" },
                { name: "fume hood", location: "A6.615", color: "yellow", imgfile: "Fume_Hood", default: 3, plural: 1, status: "" },
                { name: "sharps container", location: "B15.215", color: "green", imgfile: "Sharps_Container", default: 2, plural: 1, status: "" },
                { name: "hand-washing sink", location: "B2.315", color: "purple", imgfile: "handwashingsink", plural: 1 default: 1, plural: 1, status: "" },
                { name: "biohazard boxes", location: "B15.400", color: "blue", imgfile: "Biohazard_Box", default: 4, plural: 2, status: "" },
                { name: "dish-washing sink", location: "A8.315", color: "green", imgfile: "dishwashingsink", default: 2, plural: 1, status: "" },
                { name: "latex gloves", location: "B14.320", color: "purple", imgfile: "latexgloves", default: 1 plural: 2, status: "" },
                { name: "heat resistant gloves", location: "B15.320", color: "yellow", imgfile: "Heat_Resistance_Gloves", default: 2, plural: 1, status: "" },
                { name: "paper towels", location: "B15.520", color: "blue", imgfile: "papertowels", default: 4, plural: 2, status: "" },
                { name: "goggles", location: "B7.235", color: "purple", imgfile: "goggles", default: 1, plural: 2, status: "" },
                { name: "first-aid kit", location: "B7.500", color: "green", imgfile: "first_aid_kit_with_map", default: 2, plural: 1, status: "" }
      ]
      
      $numberWrong = 0

      objects.each do |i|
        
        $pass = 0
         
         while $pass == 0 do
          
          data = show {
          title "Where #{pluralize.is(i[:plural])} the #{i[:name]}?"
          note "The location is #{i[:location]}. \nPlease go to the #{i[:name]} and note the color of the dot that is on or near the object, and then return to the computer. 
          \n\nWhat color was the dot associated with the #{i[:name]}? "
          select [ "purple", "green", "yellow", "blue"], var: "choice", label: "Please select the correct color", default: i[:default]
          image "#{i[:imgfile]}"
          }
          choice = data[:choice]
    
          if choice == "#{i[:color]}"
            $pass = 1
            show {
              title "That is correct! "
              note "You have successfully located the #{i[:name]} in the lab."
            }
          else
            show {
              title "That is incorrect."
              note "Please return to the #{i[:name]} and then answer again."
              image "#{i[:imgfile]}"
            }
            $numberWrong = $numberWrong + 1
            i[:status] = "Fail - #{i[:name]}"
          end
          
        end
    end
    
    if $numberWrong > 1
      show {
        title "You have failed this protocol. "
        note "Your score is unsatisfactory. You will have to retake this protocol. "
      }
      status = "Fail"
      return status
    else
      show { 
        title "Congratulations! You have passed this protocol."
      }
      status = "Pass"
      return status
    end
    
  end
end
