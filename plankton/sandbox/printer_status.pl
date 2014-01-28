# Example query for printer:
# http://bioturk.ee.washington.edu:3008/devices/4e5becf4-d281-03d3-cfbc-6aab729a7fb5/command?cmd=print&text=Hello&qrcode=World


info_string = "info"


step
  description: "info query launched from variable"
  note: "Click next to launch the query"
end


# http
#   host: "http://bioturk.ee.washington.edu"
#   port: "3008"
#   path: "/devices/f7282f5c-ac01-77a5-5ef9-a9861beef515/command"
#   query
#     cmd: info_string
#   end
#   status: s
#   body: b
# end


step
  description: "Request status"
  note: "\n\nStatus code: %{s}\n\nBody: %{b}"
end


step
  description: "info query launched from string literal"
  note: "Click next to launch the query"
end


# http
#   host: "http://bioturk.ee.washington.edu"
#   port: "3008"
#   path: "/devices/f7282f5c-ac01-77a5-5ef9-a9861beef515/command"
#   query
#     cmd: "info"
#   end
#   status: s
#   body: b
# end


step
  description: "Request status"
  note: "\n\nStatus code: %{s}\n\nBody: %{b}"
end
