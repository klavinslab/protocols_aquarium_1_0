http
  host: "http://bioturk.ee.washington.edu"
  port: "3008"
  path: "/devices/4e5becf4-d281-03d3-cfbc-6aab729a7fb5/command?cmd=info"
  query
    cmd: "info"
  end
  #query
  #  cmd: "print"
  #  text: "Hello World!"
  #  qrcode: "This would be an item id"
  #  #barcode: "So would this"  # barcodes don't work right now?
  #end
  status: s
  body: b
end


step
  description: "Printer returned status %{s}."
  note: "Body: %{b}."
end
