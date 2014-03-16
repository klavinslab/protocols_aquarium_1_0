a = "testkey"
ha = { hi: "there", foo: 2}

step
  description: "Demonstrate hash assignment"
end

ha[a] = "assigning to a string variable works this way"
from_symbol = ha[:testkey]
from_var = ha[a]
from_string = ha["testkey"]

step
  description: "Maybe says assigning to a string variable works this way twice"
  note: "%{from_symbol} %{from_var} %{from_string}"
end
