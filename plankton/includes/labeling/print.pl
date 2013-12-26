# Example query for printer:
# http://bioturk.ee.washington.edu:3008/devices/4e5becf4-d281-03d3-cfbc-6aab729a7fb5/command?cmd=print&text=Hello&qrcode=World

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
