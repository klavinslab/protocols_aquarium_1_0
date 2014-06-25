argument
  percent: number, "Enter the percent Glycerol you want to make"
  volume: number, "Enter the ml of Glycerol you want to make"
end

x = 0
y = 0

x = percent*volume/100
y = (100-percent)*volume/100

step
  description: "This protocol makes Stock Glycerol"
end

take
  if volume<250
    z = 1 "250 mL Bottle"
  elsif volume < 500
    z = 1 "500 mL Bottle"
  else
    z = 1 "1 L Bottle"
  end
  1 "Glycerol"
end

step
  description: "Uncap bottle and add %{x} mL of the Glycerol to it using a pipette man and a serological pipette."
end

step
  description: "Add %{y} mL of the DI water to it using a pipette man and a serological pipette."
end

step
  description: "Screw on the cap half way. MAKE SURE IT IS STILL LOOSE ENOUGH THAT IT IS NOT AIR TIGHT. Put a peice of autoclave tape on it"
end

step
  description: "Autoclave the bottle for 15 mins at 125C"
end

step
  description: "Take the Bottle out once the cycle is complete and tighten the cap. Label the bottle %{percent} Percent Glycerol Stock."
end

produce
  1 "%{percent} Percent Glycerol Stock"
  release z
end

release [Glycerol]
