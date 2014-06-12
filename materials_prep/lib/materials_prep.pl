# Common media functions


function clean_spatula()
  step
    description: "Clean the spatula"
    note: "Use 70%% ethanol and a new kim wipe to wipe off the spatula."
  end
end


function add_dry_reagent(container, reagent, grams)
  clean_spatula()

  step
    description: "Measure and add %{grams} g of %{reagent}"
    note: "Using a scale, weigh out %{grams} g of %{reagent} and add to %{container}.\n\nDo not return any excess to the source bottle."
    image: "pouring_dry_reagent_into_1_L_bottle"
  end
end


function syringe_filter_sterilize(volume, name)
  take
    tube = 1 "50 mL Falcon Tube"
    filter = 1 "25 mm Syringe Filter"
    syringe = 1 "30 mL Syringe"
  end

  step
    description: "Prepare the falcon tube"
    note: "Label the new Falcon tube temporarily as 'filter sterilized'. Loosen the cap(s) of the new falcon tube and %{name}."
  end

  step
    description: "Draw up %{volume} mL of %{name} into the syringe and attach the filter"
    note: "Remove the backing from the filter package so the filter is easy to access.\n\nUsing the syringe (without filter), draw up %{volume} mL of %{name}. Screw the syringe onto the filter."
    warning: "Never touch the bottom or sides of the filter - they must remain sterile."
  end

  step
    description: "Dispense into falcon tube"
    note: "Dispense the solution through the filter into the falcon tube labeled 'filter sterilized'. Replace all caps when you have finished dispensing."
    warning: "Do not touch the filter to the falcon tube."
  end

  # Nothing is produced - it's up to you to keep track of that!

  release [filter[0], syringe[0]]
end


function melt_agar(media, power)
  step
    description: "Insert media in microwave."
    note: "Put %{media} in Microwave M1. Make sure to loosen the cap."
  end

  step
    description: "Set the time and power."
    note: "To set the cook time, press 'Cook' then '200' for 2 minutes. To set the power, press 'Power' then %{power}. Press 'Start.'"
    warning: "Keep an eye on it to make sure it does not boil over."
  end

  step
    description: "Swirl the media."
    note: "Using the gloves, take the %{media} out of the microwave carefully. Take off the cap for a few seconds and let some heat be released. Replace the cap, and carefully swirl."
    warning: "Swirl over the bench. Don't let it bubble over!"
  end

  step
    description: "Continue microwaving until molten"
    check: "Microwave 1 minute 30 seconds at power %{power}, then swirl"
    check: "Microwave 1 minute at power %{power}, then swirl"
    check: "Microwave 1 minute at power %{power}, then swirl"
    check: "Microwave 30 seconds at power %{power}, then swirl"
    check: "Microwave 30 seconds at power %{power}, then swirl"
    warning: "To check if the agar is completely melted, CAREFULLY hold the agar up to the light and swirl. If no solid agar is present, it is done."
  end
end
