argument
  word: string, "yes or no"
end

if word == "yes"
  step
    description: "'%{word}' is yes!"
  end
elseif word == "no"
  step
    description: "'%{word}' is no!"
  end
else
  step
    description: "'%{word}' is something else!"
  end
end
