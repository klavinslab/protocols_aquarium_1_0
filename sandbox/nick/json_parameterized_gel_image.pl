argument
  parameter_path: string, "Path to your (json) parameter set for the gel lanes"
end

input
  params = parameter_path
end

include "cloning/workflow/025_image_gel.pl"
  gel: params[:gel]
end
