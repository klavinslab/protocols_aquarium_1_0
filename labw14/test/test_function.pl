function cleanup(msg)
  step
    description: "Clean up your workstation"
    note: "%{msg}"
  end
end

cleanup("Leave it cleaner than you found it")
