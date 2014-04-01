# Instead of manually inputting params, use JSON that can be reused/added to

argument
  parameter_path: string, "Path to your (json) parameter set for the Gibson"
end

input
  params = parameter_path
end

include "cloning/workflow/045_gibson.pl"
  fragments: params[:fragments]
  volumes: params[:volumes]
  group_n: params[:group_n]
  products: params[:products]
end
