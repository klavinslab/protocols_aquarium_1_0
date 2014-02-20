argument
  word: string, "yes or no"
end

if word == "yes"
  step
    description: "'%{string}' is yes!"
  end
elseif word == "no"
  step
    description: "'%{string}' is no!"
  end
else
  step
    description: "'%{string}' is something else!"
  end
end
