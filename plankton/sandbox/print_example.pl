step
  description: "Select test"
  getdata
    test_option: string, "Select your test option - do you want to get info or print a label (this will actually print a real label).", ["Info", "Print Label"]
  end
end

step
  description: "The next step will send an http request that may timeout"
end


# FIXME: path argument has to be string - can't even be a variable. Would be
# handy to keep device uuid, server url, port, etc, abstracted at the beginning
if test_option == "Print Label"
  http
    host: "http://bioturk.ee.washington.edu"
    port: "3008"
    path: "/devices/f7282f5c-ac01-77a5-5ef9-a9861beef515/command"
    query
      cmd: "print"
      text: "Hello World"
      qrcode: "Item uuid"
    end
    status: s
    body: b
  end
else
  http
    host: "http://bioturk.ee.washington.edu"
    port: "3008"
    path: "/devices/f7282f5c-ac01-77a5-5ef9-a9861beef515/command"
    query
      cmd: "info"
    end
    status: s
    body: b
  end
end


if s == "200" && b == "OK"
  step
    description: "Your label has been printed in B040. Go get it!"
  end
end

step
  description: "Printer returned status %{s}."
  note: "Body: %{b}."
end
