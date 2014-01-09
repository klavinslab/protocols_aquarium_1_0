information "Autoclave yeast media"

argument
  sdo_liquid_n: number, "Enter the number of SDO liquid media bottles to autoclave."
end

argument
  sdo_agar_n: number, "Enter the number of SDO agar media bottles to autoclave."
end

argument
  sc_liquid_n: number, "Enter the number of SC liquid media bottles to autoclave."
end

argument
  ypad_liquid_n: number, "Enter the number of YPAD liquid media bottles to autoclave."
end

argument
  ypad_agar_n: number, "Enter the number of YPAD agar media bottles to autoclave."
end

# Take media bottles
if sdo_liquid_n > 0
  take
    sdo_liquid = sdo_liquid_n "800 mL SDO Liquid (unsterile)"
  end
end
if sdo_agar_n > 0
  take
    sdo_agar = sdo_agar_n "800 mL SDO Agar (unsterile)"
  end
end
if sc_liquid_n > 0
  take
    sc_liquid = sc_liquid_n "800 mL SC Liquid (unsterile)"
  end
end
if ypad_liquid_n > 0
  take
    ypad_liquid = ypad_liquid_n "800 mL YPAD Liquid (unsterile)"
  end
end
if ypad_agar_n > 0
  take
    ypad_agar = ypad_agar_n "800 mL YPAD Agar (unsterile)"
  end
end


step
  description: "Apply autoclave tape"
  note: "Apply autoclave tape to each item. Loosen lids, then make sure autoclave tape extends fully over the lid and onto the sides of the item. The seal will have to be broken to use the sterilized item."
end


# Take solid media bottles
if sdo_agar_n 0 1 || ypad_agar_n 0 1
  # Autoclave A1 can't handle agar, so don't use it
  autoclave = "A2"
else
  step
    description: "Select an autoclave"
    getdata
      autoclave: string, "Select which autoclave to use: tabletop autoclave A1 or freestanding autoclave A2.", ["A1", "A2"]
    end
  end
end


# Usage differences between the autoclaves
if autoclave == "A1"
  check_autoclave = "Check that the low water indicator is not flashing. Refill the reservoir if the water is low."
  open_autoclave = "Close the autoclave door until it latches, pull the screw handle over to the front of the autoclave (unscrew if necessary), and rotate it clockwise until it is tight."
  set_autoclave = "Select optional cycle. Set the temperature to 110°C for 15 minutes. Then, hit the up button to start."
  finished_indicator = "The autoclave will beep twice every few seconds until you hit the stop button."
else
  check_autoclave = "Check the water level. Inside the autoclave, the water should be high enough to almost cover the hexagonal plate. If it is low, fill with DI water.\n\nCheck the steam receptacle (the plastic bottle at the front of the autoclave). The receptacle's water level should be between low and high. If it is above this, empty into the sink."
  open_autoclave = "Close the hatch and seal by rotating clockwise and secure the magnetic safety device to the hatch."
  set_autoclave = "Set the temperature to 110°C and time at pressure to 15 minutes. Then, hit start."
  finished_indicator = "The autoclave will beeps 5 times in a row *just once* when it is done."
end


# Use the autoclave
step
  description: "Check the autoclave"
  check: "%{check_autoclave}"
end
step
  description: "Place items in the autoclave and seal."
  note: "Place all items one at a time into the autoclave.\n\n%{open_autoclave}"
  warning: "Make sure no caps are tight. If a cap is tight, the item may explode."
end
step
  description: "Set autoclave settings and start."
  note: "%{set_autoclave}"
end
step
  description: "Wait around until the autoclave finishes."
  note: "This will take between 45 minutes and two hours. You can leave this job running and do other tasks while the autoclave is running - when the autoclave is done, resume by finding the job and resuming it. %{finished_indicator}. When the autoclave finishes, click next."
end


take
  gloves = 1 "Autoclave Gloves"
end


step
  description: "Remove items from the autoclave to a cooling area (the media station)."
  note: "When items are around 50°C (no longer hurts to touch), proceed to the next step."
  getdata
    items_location: string, "Location that you put the items to cool (in standard format, e.g. B1.320)"
  end
  warning: "Use autoclave gloves. If any of the items contain agar, make sure to launch a pouring protocol soon or keep them at or above 50°C."
end


# Produce media bottles
# FIXME: retain data in SDO bottles in sterilized versions. Difficult if data varies, need 1 produce for each different kind.
if sdo_liquid_n > 0
  produce
    sterile_sdo_liquid = sdo_liquid_n "800 mL SDO Liquid (sterile)"
    release sdo_liquid
    location: items_location
  end
end
if sdo_agar_n > 0
  produce
    sterile_sdo_agar = sdo_agar_n "800 mL SDO Agar (sterile)"
    release sdo_agar
    location: items_location
  end
end
if sc_liquid_n > 0
  produce
    sterile_sc_liquid = sc_liquid_n "800 mL SC Liquid (sterile)"
    release sc_liquid
    location: items_location
  end
end
if ypad_liquid_n > 0
  produce
    sterile_ypad_liquid = ypad_liquid_n "800 mL YPAD Liquid (sterile)"
    release ypad_liquid
    location: items_location
  end
end
if ypad_agar_n > 0
  produce
    sterile_ypad_agar = ypad_agar_n "800 mL YPAD Agar (sterile)"
    release ypad_agar
    location: items_location
  end
end


release gloves
