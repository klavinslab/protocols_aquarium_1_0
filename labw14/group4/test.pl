# test bed for trying ideas

require "labw14/group4/lib.pl"

a = [{id: 1, original_id: "a"}, {id: 2, orginal_id: "b"}, {id: 3, original_id: "a"}]

step
  description: "%{a}"
end

s = find_original("a", a)

step
  description: "sample %{s} came from the original sample 'a'"
end

d = find_original("b", a)

step
  description: "sample %{d} came from the original sample 'b'"
end

f = find_original("a", a)

step
  description: "the first occurance of 'a' is %{f}. This should not be id:3"
end
