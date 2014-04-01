# Instead of manually inputting params, use JSON that can be reused/added to

argument
  parameter_path: string, "Path to your (json) parameter set for gel purification"
end

input
  params = parameter_path
end

include "cloning/workflow/035_gel_purify.pl"
  GelSlice_id: params[:GelSlice_id]
  isop: params[:isop]
end
