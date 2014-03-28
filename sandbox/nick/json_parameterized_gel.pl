# Instead of manually inputting params, use JSON that can be reused/added to

argument
  parameter_path: string, "Path to your (json) parameter set for PCR"
end

input
  params = parameter_path
end

include "cloning/workflow/020_run_gel.pl"
  fragment_names: params[:fragment_names]
  ladder_one: params[:ladder_one]
  fragment_volume: params[:fragment_volume]
end
