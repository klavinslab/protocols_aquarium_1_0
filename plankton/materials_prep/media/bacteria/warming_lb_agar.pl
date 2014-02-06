information "Warm up a bottle of solid agar in a microwave to a molten state so that it can be poured into plates."


argument
  volume: number, "Volume of LB to melt (200 or 400), in mL"
  n: number, "The number of bottles to melt"
end


if volume != 200 && volume != 400
  step
    description: "The LB volume was incorrectly entered as %{volume}."
    getdata
      volume: number, "Enter the volume of LB to make.", [200, 400]
    end
  end
end
media_type = volume + " mL LB Agar (sterile")


# Take media type
take
  media = n media_type
  gloves = 1 "Autoclave Gloves"
end

# Melt agar
if media_type == "400 mL LB Agar (sterile)"
  include "plankton/includes/materials_prep/melt_agar.pl"
    media: media_type
    power: 6
  end
else
  include "plankton/includes/materials_prep/melt_agar.pl"
    media: media_type
    power: 3
  end
end

#if media_type == "200 mL LB Agar (sterile)"
#    molten_string = "200 mL LB Agar (molten)"
#else
#    molten_string = "400 mL LB Agar (molten)"
#end

#produce
#  product = 1 molten_string
#  release media
#  location: "B1.305"
#end

release media

release gloves
