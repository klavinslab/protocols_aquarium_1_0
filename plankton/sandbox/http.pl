information "Do a Google search on life."


http
  host: "http://www.google.com"
  query
    q: "life"
  end
  status: s
  body: b
end


step
  description: "Google returned status %{s}."
  note: "%{b}"
end
