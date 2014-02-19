function cleanup(msg1, msg2)
  step
    description: "Clean up your workstation"
    note: "%{msg}"
  end
  step
    description: "Replace empty tip boxes with new tip boxes."
    note: "%{msg2}"
  end
end

cleanup("Leave it cleaner than you found it", "Put empty boxes on bench where it says empty boxes")
