# Instead of manually inputting params, use JSON that can be reused/added to

argument
  parameter_path: string, "Path to your (json) parameter set for nanodropping"
end

input
  params = parameter_path
end

include "cloning/workflow/040_nanodrop.pl"
  fragment: params[:fragment]
end
