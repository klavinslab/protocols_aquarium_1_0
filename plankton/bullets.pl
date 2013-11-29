step
  description: "A step with bullets"
  bullet: "The first thing."
  bullet: "The second thing."
  note: "This note should come after the bullets."
  getdata
    x: number, "A number"
    y: string, "A string"
    z: string, "Choose a letter", [ "A", "B" ]
  end
  bullet: "The third thing."
  check: "Check this box when done reading this step."
  warning: "If this warning is not bright enough or not last, call for help!"
end

step
  description: "Results"
  note: "You entered x = %{x}, y = %{y}, and z = %{z}."
end
