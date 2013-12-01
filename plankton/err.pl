information "Errors, errors, errors"

modify 1
 location: "%{X}"
end

log
  w : 1
  x : q
  y : "huh?"
end

x = "yo"

include "plankton/say_hello.pl"
  u : " " + x + " from add_one.pl"
end

x = y
z = 2

http
  host: "http://www.google.com"
  query
    q: "life%{x}"
  end
  status: s
  body: b
end

x = 1

if x == 0

  step
    description: "Hello."
  end

elsif x == 1

  while qwe

    step
      description: "Goodbye."
    end

  end

end

