argument
  shocked_cells: sample array, "Array of heat shocked cells"
  json_file: string, "the json file associated with this metacol.  This is a hack until the :data field gets fixed."
end

if json_file == ""
  json_file = "protocols/recombineering/test.json"
end

input
  jdat = json_file
end

step

  note: "%{jdat}"
end
