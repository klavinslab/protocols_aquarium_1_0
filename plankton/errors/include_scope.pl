x = "Original Value"

include "plankton/errors/include_scope_included.pl"
  x: "New Value"
end

step
  description: "The value of x:"
  note: "%{x}"
end
