#By David Starkebaum and Erik Josberger, 2014/02/13
step
  description: "Move to Media Bay"
  check: "This protocol must be performed in the Media Bay. Go there and use that computer
                before continuing. Once all media is prepared, you will move to the plate reader bay
                (The program will instruct you when it is time to transfer)"
end

step
  description: "This protocol will prepare two 30mL aliquots of 0.4 percent glucose with amp and kan."
  note: "This is a serological pipette (you will fech this in the next step)"
  image: "serological_pipette"
  note: "The 'M9 liquid Glucose' listed in the next step should be 0.4 percent glucose
         (you may want to write this down this down)"
end

take
 media_tube = 2 "50 mL Falcon Tube"
 media = 1 "400 mL M9 liquid Glucose"
 pipette = 1 "Serological Pipette"
 tip = 1 "25 mL Serological Pipette Tips"
 amp = 1 "100X 1 mL Ampicillin Aliquot"
 kan = 1 "200X 1 mL Kanamycin Aliquot"
 note: "You will need at least 0.12 mL of amp, and 0.30 mL of kan for the next step,
        so check the level of the liquid in your aliquots to be sure they are sufficient.
        Also, use the 0.4 percent glucose solution"
end

step
  description: "Information about the serological pipetter"
  note: "Note that the pipette tip has two sets of numbers:"
  bullet: "The larger set of numbers on the pipette tip count down from 25mL ('0mL' is full, '25ml' is empty)"
  bullet: "The smaller numbers count up from 0 ('0mL' is empty, '25ml' is full)"
  bullet: "Use whichever scale is convenient for you, but just be aware which you are using"
  note: "The pipetter has two 'triggers'"
  bullet: "The top trigger pulls liquid into the pipette tip"
  bullet: "The bottom trigger ejects liquid out"
  bullet: "The harder you press the trigger, the faster the pump goes"
end

step
  description: "Add 30mL of 'M9 liquid Glucose' to each of the two 50mL falcon tubes"
  check: "Unscrew the caps of the glucose solution, as well as your two empty falcon tubes"
  check: "Attach the 25mL tip to the serological pipetter"
  note: "You will add a total of 30mL glucose media to each falcon tube (in two steps, since the max volume
         is 25mL for the pipetter)"
  check: "Use the electric serological pipette to add 15 mL of 'M9 liquid Glucose' into a 50mL falcon tube"
  check: "Add another 15 mL of 'M9 liquid Glucose' into the 50mL falcon tube"
  check: "Add 15mL of 'M9 liquid Glucose' into the second 50mL falcon tube"
  check: "Add another 15mL 'M9 liquid Glucose' to the second 50mL falcon tube"
  check: "Dispose of your 25mL serological pipette tip in biohazard bin"
end

#query = "none"
#step
# description: "Add antibiotics "
# check: "Vortex the kan and amp solutions or 5 seconds before proceeding"
# note: "You will need at least 0.12 mL of amp, and 0.30 mL of kan for the next step,
#        so check the level of the liquid in your aliquots to be sure they are sufficient."
# check: "Grab another aliquot of kan or amp if you do not have enough"
# getdata
#  query: string, "Choose 'amp' if you need more amp, 'kan' if you need more kan, 'both' if you need both, or 'none' if you have enough already", ["amp", "kan", "both", "none"] 
# end
#end
#
#if query == "amp"
#  take
#    more_amp = 1 "100X 1 mL Ampicillin Aliquot"
#  end
#elsif query == "kan"
#  take
#    more_kan = 1 "200X 1 mL Kanamycin Aliquot"
#  end
#elsif query == "both"
#  take
#    more_amp = 1 "100X 1 mL Ampicillin Aliquot"
#    more_kan = 1 "200X 1 mL Kanamycin Aliquot"
#  end
#end

step
  description: "Add antibiotics to the 50mL falcon tubes"
  note: "Make sure the antibiotics are fully melted"
  note: "If the kan and amp solutions are not completely melted yet, you can hold them in your hand to warm
        them up until they are fully liquid"
  check: "Vortex the kan and amp solutions for 5 seconds before proceeding"
  check: "Pipette 60 uL from your '100X 1 mL Ampicillin Aliquot' to the first 50mL falcon tube"
  check: "Pipette 60 uL from your '100X 1 mL Ampicillin Aliquot' to the second 50mL falcon tube"
  check: "Pipette 150 uL from your '200X 1 mL Kanamycin Aliquot' to the first 50mL falcon tube"
  check: "Pipette 150 uL from your '200X 1 mL Kanamycin Aliquot' to the second 50mL falcon tube"
end

step
  description: "Vortex the solutions"
  check: "Vortex the first 50mL Falcon for 15 seconds"
  check: "Vortex the second 50mL Falcon for 15 seconds"
end

release concat(media, concat(pipette,concat(amp, kan)))

produce silently
  m1 = 1 "30 mL M9 liquid Glucose + amp + kan"
  m2 = 1 "30 mL M9 liquid Glucose + amp + kan"
  location: "Bench"
end
