#information "This protocol explains how to calculate the pipetting error rate."

class Protocol
  def main
    show {
      title "Know the total volume."
      note "The total volume is the volume that the liquid SHOULD be after pipetting. If you just executed the large volume pipetting exercise,
      the total volume is 1000 µL. If you just executed the small volume pipetting exercise, the total volume is 10 µL."
    }
    
    show {
      title "Draw up the liquid."
      note "If the total volume is 10 µL, make sure you have centrifuged all the the liquid to the bottom of the tube. Using the correct pipette that is set to the total volume, draw up as much liquid from the tube as 
      possible. There are three possible outcomes after this step. Pick which outcome best applies."
      select [ "There is still liquid left in the tube.", "There is not more liquid left in the tube, but there is air at the bottom of the
              pipette tip.", "There is no more liquid left in the tube, and there is no air at the bottom of the 
              pipette tip." ], var: "choice", label: "Outcome possibilities:", default: 1
    }
    
    choice = data[:choice]
    
    if choice == "There is still liquid left in the tube."
      show {
        title "Too much liquid was pipetted."
        note "Dispose of the tip with liquid in it add a fresh tip and pipette up the remaining liquid, then slowly  
        rotate the volume dial to decrease the volume until the liquid reaches the bottom of the tip. This volume 
        is the new volume."
      }
      show {
        title "Calculate the error."
        note "The error rate is (new volume / total volume)."
      }

    elsif choice == "There is not more liquid left in the tube, but there is air at the bottom of the pipette tip."
      show {
        title "Too little liquid was pipetted."
        note "Slowly rotate the volume dial to decrease the volume until the liquid reaches the bottom of the tip. This
        volume is the new volume."
      }
      show {
        title "Calculate the error."
        note "The error rate is (total volume - new volume) / total volume."
      }

    else
      show {
          title "Congratulations!"
          note "The error rate is 0."
      }
    end
        
    show {
      title "Write down the error rate."
      note "Repeat this protocol for every tube of liquid."
    }
  end
end
