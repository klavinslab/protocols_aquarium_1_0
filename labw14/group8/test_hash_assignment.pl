a = "testkey"
ha = { hi: "there", foo: 2}

step
  description: "Demonstrate hash assignment"
end

# behavior for assigning to a string variable
ha[a] = "ha[a]"
symbols_and_strings_overlap = ha[:testkey]
from_var = ha[a]
from_string = ha["testkey"]

result = { symbols_and_strings_overlap: ha[:testkey],
           from_var   : ha[a],
           from_string:  ha["testkey"]}

step
  description: "Maybe says assigning to a string variable works this way"
  note: "from_symbol %{from_symbol} 
         from_var %{from_var} 
         from_string %{from_string}
         and from hash
         %{result}"
         
ha[a] = "ha[a]"
symbols_and_strings_overlap = ha[:testkey]
from_var = ha[a]
ha["testkey"] = "ha['testkey']"
from_string = ha["testkey"]

result = { symbols_and_strings_overlap: ha[:testkey],
           from_var   : ha[a],
           from_string:  ha["testkey"]}

step
  description: "Maybe says assigning to a string variable works this way"
  note: "from_symbol %{from_symbol} 
         from_var %{from_var} 
         from_string %{from_string}
         and from hash
         %{result}"
end
