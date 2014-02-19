argument
  eDNA: sample, "Extracted DNA"
end

step
  description: "Pureify the extracted genome."
end

take
  1 "Zymo Genomic DNA Clean & Concentrator"
end

step
  description: "Prepare the purification Column"
  warning: "Check that the DNA Wash Buffer is labled as having ethanol added.  If not, do so now as instructed on the bottle."
  check: "Pipette the extracted DNA into a new 1.5 mL tube."
  check: "Pipette a volume of ChIP DNA Binding Buffer equal to twice the volume of DNA extracted into the tube.  Mix thoroughly"
  check: "Transfer the mixture into a new Zymo-Spin IC-XL Column.  Place the Column in a Collection Tube."
end

step
  description: "DNA Purification 1"
  check: "Centerfuge the collection Tube for 30 seconds.  Discard and replace the collection tube."
  check: "Add 200uL DNA Wash Buffer to the column.  Centerfuge for 1 minute.  Discard and replace the collection tube."
end

step
  description: "DNA Purification 2"
  check: "Repeat the above Wash Buffer step."
  check: "Add 200uL DNA Wash Buffer to the column.  Centerfuge for 1 minute.  Discard and replace the collection tube."
  check: "Pipette 15 uL DNA Elution Buffer directly into the base of the collection tube.  Allow to incubate for 1 minute at room tempurature."
  check: "Place the column in a 1.5mL tube.  Centrifuge for 30 seconds to elute the DNA.  The tube contains purified DNA.  The column can be discarded."
end
