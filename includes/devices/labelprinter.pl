# Example query for printer:
# http://bioturk.ee.washington.edu:3008/devices/4e5becf4-d281-03d3-cfbc-6aab729a7fb5/command?cmd=print&text=Hello&qrcode=World
# TODO:
# (4) Use in labeling protocol
# (5) Troubleshoot possible bugs:
#     barcodes don't work
#     a request sent to /devices/<uuid>/command, without arguments or with bad argument, returns helpful text but not useful error code

argument
  text: string, "Text to be printed on the label. Cannot be blank."
end


argument
  qrcode: string, "Text to be formatted into a qrcode. If left blank, no qrcode is printed."
end


# FIXME: barcode query isn't working (SQUID device bug)
#argument
#  barcode: string, "Text to be formatted into a barcode. If left blank, no qrcode is printed."
#end


http
  host: "http://bioturk.ee.washington.edu"
  port: "3008"
  path: "/devices/f7282f5c-ac01-77a5-5ef9-a9861beef515/command"
  query
    cmd: "print"
    text: text
    qrcode: qrcode
  end
  status: s
  body: b
end


# Use the `printed` variable to decide whether to take action on a failed
# print attempt
if s == 200 && b == "OK" || s == "200" && b == "OK"
  printed = "True"
else
  step
    description: "A label failed to print."
    note: "\n\nStatus code: %{s}\n\nBody: %{b}"
  end
  printed = "False"
end
