# Instead of manually inputting params, use JSON that can be reused/added to

argument
  parameter_path: string "Path to your (json) parameter set for PCR"
end

input
  params = parameter_path
end

include "cloning/workflow/010_PCR.pl"
  initials: params[:initials]
  enzyme_id: params[:enzyme_id]
  fragment_names: params[:fragment_names]
  forward_ids: params[:forward_ids]
  reverse_ids: params[:reverse_ids]
  template_ids: params[:template_ids]
  tanneal: params[:tanneal]
end
