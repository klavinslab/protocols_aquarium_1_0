step
  description: "Prepare a fresh dilution of NaOH"
end

take
  water = 1 "50 mL Molecular Grade Water aliquot"
  NaOH = 1 "Sodium Hydroxide (NaOH) Powder"
end

step
  description: "Prepare the dilution"
  check: "Lable a 1.5mL microcentrifuge tube with the date and your initials"
  check: "Pipette 1000uL of molecular grade water into the tube"
  check: "Carefully weigh out and add to the tube 8g of NaOH."
  check: "Invert the tube several times to mix"
end

produce
  r = 1 "0.4 N NaOH dilution"
end

release concat(water, NaOH)

log
  return: {NaOH: r}
end
