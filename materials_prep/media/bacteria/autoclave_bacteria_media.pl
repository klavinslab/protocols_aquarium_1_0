information "Autoclave bacterial media"

# FIXME: in this and yeast autoclaving protocol, should produce sterile versions of items!
# FIXME:
argument
  lb_liquid_n: number, "Enter the number of LB liquid media bottles to autoclave."
end

argument
  lb_agar_n: number, "Enter the number of LB agar media bottles to autoclave."
end

argument
  tb_liquid_n: number, "Enter the number of TB liquid media bottles to autoclave."
end


# Take media bottles
if lb_liquid_n > 0
  take
    lb_liquid = lb_liquid_n "800 mL LB Liquid (unsterile)"
  end
end
if lb_agar_n > 0
  take
    lb_agar = lb_agar_n "800 mL LB Agar (unsterile)"
  end
end
if tb_liquid_n > 0
  take
    tb_liquid = tb_liquid_n "800 mL TB Liquid (unsterile)"
  end
end


step
  description: "Apply autoclave tape"
  note: "Apply autoclave tape to each item. Loosen lids, then make sure autoclave tape extends fully over the lid and onto the sides of the item. The seal will have to be broken to use the sterilized item."
end


# Take solid media bottles
if lb_agar_n > 0
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
  set_autoclave = "Select liquid cycle and start, which will heat 121°C for 15 minutes at pressure. Then, hit start."
  finished_indicator = "The autoclave will beep twice every few seconds until you hit the stop button."
else
  check_autoclave = "Check the water level. Inside the autoclave, the water should be high enough to almost cover the hexagonal plate. If it is low, fill with DI water.\n\nCheck the steam receptacle (the plastic bottle at the front of the autoclave). The receptacle's water level should be between low and high. If it is above this, empty into the sink."
  open_autoclave = "Close the hatch and seal by rotating clockwise and secure the magnetic safety device to the hatch."
  set_autoclave = "Set the temperature to 121°C and time at pressure to 15 minutes. Then, hit start."
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
if lb_liquid_n > 0
  produce
    sterile_lb_liquid = lb_liquid_n "800 mL LB Liquid (sterile)"
    release lb_liquid
    location: items_location
  end
end
if lb_agar_n > 0
  produce
    sterile_lb_agar = lb_agar_n "800 mL LB Agar (sterile)"
    release lb_agar
    location: items_location
  end
end
if tb_liquid_n > 0
  produce
    sterile_tb_liquid = tb_liquid_n "800 mL TB Liquid (sterile)"
    release tb_liquid
    location: items_location
  end
end


release gloves
