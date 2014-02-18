argument
  fragment_id: sample array
end

take
  fragment = item fragment_id
end

step
  description: " %{fragment_id} "
  note: "%{fragment[0]}"
end

release fragment
