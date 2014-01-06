# Given a description of the object as it is and how you want it labeled, tell the user to label it
# TODO: accept an array so multiple labels can be printed in a single call.


argument
  item_string: string, "A description of the object that needs to be labeled."
end


argument
  object_type: string, "A human-readable name for the object that will go on the label."
end


argument
  item_id: number, "The id for the item."
end


# TODO: test + implement multiple-copy printing
#argument
#  copies: number, "The number of labels to print."
#end
printed = "False"


if printed == "False"
  step
    description: "Label"
    note: "Label a piece of white lab tape with:\n\n%{object_type} | id: %{item_id}"
  end
end
