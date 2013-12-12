# Produce and apply a temporary label to an item (one that will be removed during the protocol).
# TODO: accept an array so multiple labels can be printed in a single call.


argument
  input_item_string: string, "A description of the object(s) to label (e.g. each bottle)."
end


argument
  object_type: string, "A human-readable name for the object that will go on the label."
end


# TODO: Attempt to print label first. If that fails, fall back on what is currently below this message.
step
    description: "Label"
    note: "Label %{input_item_string} with the following:\n\n%{object_type}, the bottle number, your initials, and the time using a piece of lab tape."
end
