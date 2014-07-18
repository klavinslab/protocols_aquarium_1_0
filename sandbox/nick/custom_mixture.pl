argument
  solution_ids: sample array, "Solution(s) to combine"
  volumes: number array, "Volumes (in mL) to combine"
  container_type: string, "Exact object type string for the container, e.g. 50 mL Falcon Tube"
  product_name: string, "The exact object type for the item produced."
end

take
  container = 1 container_type
  solutions = item solution_ids
end

n_solutions = length(solution_ids)
i = 0
while i < n_solutions
  current_solution = solutions[i]
  current_volume = volumes[i]
  step
    description: "Add %{current_volume} mL %{current_solution} to %{container_type}."
    note: "If the volume is 1 mL or less, use a micropipetter. Otherwise, use a serological pipetter."
  end
  i = i + 1
end

produce
  produced = 1 product_name
  release container
end

release solutions
