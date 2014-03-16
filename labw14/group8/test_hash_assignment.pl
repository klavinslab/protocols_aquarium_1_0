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
  description: "Hash example with output"
  note: "ha[a] = 'ha[a]'
         symbols_and_strings_overlap = ha[:testkey]
         from_var = ha[a]
         from_string = ha['testkey'] ---- OUTPUT ----
         symbols_and_strings_overlap %{symbols_and_strings_overlap} 
         from_var %{from_var} 
         from_string %{from_string}
         and from hash
         %{result}"
end

ha[a] = "ha[a]"
ha["testkey"] = "ha['testkey']"
from_string = ha["testkey"]
from_symbol = ha[:testkey]
from_var = ha[a]

result = { from_symbol: ha[:testkey],
           from_var   : ha[a],
           from_string:  ha["testkey"]}

step
  description: "String keys now seem to overlap with symbol keys"
    note: "ha[a] = 'ha[a]'
         ha['testkey'] = 'ha['testkey']'
         from_string = ha['testkey']
         from_symbol = ha[:testkey]
         from_var = ha[a]  ---- OUTPUT ----
         from_symbol %{from_symbol} 
         from_var %{from_var} 
         from_string %{from_string}
         and from hash
         %{result}"
end

ha[a] = "ha[a]"
ha["testkey"] = "ha['testkey']"
ha[:testkey] = "ha[:testkey]"
from_string = ha["testkey"]
from_symbol = ha[:testkey]
from_var = ha[a]

result = { from_symbol: ha[:testkey],
           from_var   : ha[a],
           from_string:  ha["testkey"]}

step
  description: "Assigning to the symbol doesn't overwrite the string"
    note: "ha[a] = 'ha[a]'
         ha['testkey'] = 'ha['testkey']'
         ha[:testkey] = 'ha[:testkey]'
         from_string = ha['testkey']
         from_symbol = ha[:testkey]
         from_var = ha[a]  ---- OUTPUT ----
         from_symbol %{from_symbol} 
         from_var %{from_var} 
         from_string %{from_string}
         and from hash
         %{result}"
end

