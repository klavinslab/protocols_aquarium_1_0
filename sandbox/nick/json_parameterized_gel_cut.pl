argument
  parameter_path: string, "Path to your (json) parameter set for the gel lanes"
end

input
  params = parameter_path
end

include "cloning/workflow/030_cut_gel.pl"
  gel: params[:gel]
  sizes: params[:sizes]
end
