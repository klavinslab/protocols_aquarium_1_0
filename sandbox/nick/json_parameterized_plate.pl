# Instead of manually inputting params, use JSON that can be reused/added to

argument
  parameter_path: string, "Path to your (json) parameter set for plating."
end

input
  params = parameter_path
end

include "cloning/workflow/052_plate.pl"
  plasmid_ids: params[:plasmid_ids]
  volume: params[:volume]
  plate_type: params[:plate_type]
end
