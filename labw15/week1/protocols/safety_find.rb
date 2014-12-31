#information "This protocol is a teaching tool for locating safety items in the laboratory."

ActiveSupport::Inflector.inflections do |inflection|
  inflection.irregular "is", "are"
end

class Protocol
  def main
    show {
      title "Directions:"
      note "In each step, you will be asked to find an item in the lab. A picture of the item and a map, with the item's location marked by a yellow dot, are provided. Walk to the location the item, note the color of the dot that is on or near it, and then return to the computer to submit your answer"
      warning "You will fail this protocol if you enter two or more incorrect answers."
    }

    objects = [ { name: "sharps container", location: "D4.130", color: "green", imgfile: "Sharps_Container", default: 2, plural: 1, status: nil },
                { name: "fire extinguisher", location: "B10.280", color: "blue", imgfile: "Fire_Extinguisher", default: 4, plural: 1, status: nil },
                { name: "shower/eyewash station", location: "A3.515", color: "yellow", imgfile: "shower-eyewash", default: 3, plural: 1, status: nil },
                { name: "fume hood", location: "A6.615", color: "yellow", imgfile: "Fume_Hood", default: 3, plural: 1, status: nil },
                { name: "hand-washing sink", location: "B2.315", color: "purple", imgfile: "handwashingsink", default: 1, plural: 1, status: nil },
                { name: "biohazard bin", location: "B13.200", color: "blue", imgfile: "Biohazard_Box", default: 4, plural: 1, status: nil },
                { name: "dish-washing sink", location: "A8.305", color: "green", imgfile: "dishwashingsink", default: 2, plural: 1, status: nil },
                { name: "latex gloves", location: "B4.300", color: "purple", imgfile: "latexgloves", default: 1, plural: 2, status: nil },
                { name: "heat resistant gloves", location: "B2.300", color: "yellow", imgfile: "Heat_Resistance_Gloves", default: 2, plural: 2, status: nil },
                { name: "paper towels", location: "B4.300", color: "blue", imgfile: "papertowels", default: 4, plural: 2, status: nil },
                { name: "goggles", location: "B7.235", color: "purple", imgfile: "goggles", default: 1, plural: 2, status: nil },
                { name: "first-aid kit", location: "B7.500", color: "green", imgfile: "first_aid_kit_with_map", default: 2, plural: 1, status: nil }
      ]
      
      $numberWrong = 0

      objects.each do |i|
        
        $pass = 0
         
         while $pass == 0 do
          
          data = show {
          title "Where #{'is'.pluralize(i[:plural])} the #{i[:name]}?"
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
      return {numberWrong: $numberWrong}
    else
      show { 
        title "Congratulations! You have passed this protocol."
      }
      status = "Pass"
      return {numberWrong: $numberWrong}
    end
    
  end
end
