 
information "Warm up a bottle of solid agar in a microwave to a molten state so that it can be poured into plates."



# Chose media type
step
  description: "What type of agar?"
  note: "Choose the type of agar to warm up."
  get data
    media_type: string, "Media Type", ["200 mL LB Agar (sterile)",
				       "400 mL LB Agar (sterile)",
				       "200 mL SDO Agar (sterile)",
				       "200 mL YPAD Agar (sterile)"]
  end
end

# Take media type
take
  media = 1 media_type
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

# Produce
if media_type == "400 mL LB Agar (sterile"
  produce "500 mL Bottle (dirty)"
  end
else
  produce "250 mL Bottle (dirty"
  end
end

produce
  product = 1 media_type
  release media
  release gloves
  location: "B1.305"
end
  
