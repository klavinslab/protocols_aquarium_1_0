information "Make widgets"

step
  description: "How many?"
  getdata
    n: number, "Number of widgets to make"
  end
end

produce
  x = n "Widget"
  note: "Thanks for making widgets!"
end

