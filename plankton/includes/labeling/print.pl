# Example query for printer:
# http://bioturk.ee.washington.edu:3008/devices/4e5becf4-d281-03d3-cfbc-6aab729a7fb5/command?cmd=print&text=Hello&qrcode=World
# TODO:
# (1) Get basic http requests working properly - arguments aren't being sent?
# (2) Get printer text + qrcodes working
# (3) Make this file print subprotocol with qrcode/text arguments
# (4) Use in labeling protocol
# (5) Troubleshoot possible bugs:
#     barcodes don't work
#     a request sent to /devices/<uuid>/command, without arguments or with bad argument, returns helpful text but not useful error code

#argument
#  text: string, "Text to be printed on the label. Cannot be blank."
#end
#
#
#argument
#  qrcode: string, "Text to be formatted into a qrcode. If left blank, no qrcode is printed."
#end
#
#
#argument
#  barcode: string, "Text to be formatted into a barcode. If left blank, no qrcode is printed."
#end


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
