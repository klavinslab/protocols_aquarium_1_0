# Instead of manually inputting params, use JSON that can be reused/added to

argument
  parameter_path: string, "Path to your (json) parameter set for the gel lanes"
end

input
  params = parameter_path
end

include "cloning/workflow/025_mage_gel.pl"
  gel: params[:gel]
end
