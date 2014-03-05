x = "Original Value"

include include_scope_included.pl
  x: "New Value"
end

step
  description: "The value of x:"
  note: "%{x}"
end
