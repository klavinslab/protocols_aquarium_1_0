step
  description: "Would you like to stop?"
  getdata
    answer: string, "Your answer", ["Yes","No"]
  end
end

if answer == "Yes"
  stop
else
  step
    description: "Okay, we don't stop just yet."
    note: "But this is the last step."
  end
end
