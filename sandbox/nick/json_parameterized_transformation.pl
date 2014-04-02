# Instead of manually inputting params, use JSON that can be reused/added to

argument
  parameter_path: string, "Path to your (json) parameter set for the Transformation"
end

input
  params = parameter_path
end

include "cloning/workflow/050_ecoli_transformation.pl"
  plasmid_ids: params[:plasmid_ids]
  e_coli_strain_type: params[:e_coli_strain_type]
  plate_type: params[:plate_type]
end
