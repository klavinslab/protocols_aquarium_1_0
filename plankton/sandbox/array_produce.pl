include "plankton/sandbox/lib.pl"

argument
  ids: sample("Transformed E coli Strain") array, "Stocks"
end

take
  strains = item ids
end

result = produce_minipreps(strains)

step
  description: "Result"
  note: "You made these new items: %{result}"
end

release strains
