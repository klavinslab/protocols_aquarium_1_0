argument
  fragment: sample,"The cDNA sample to run in qPCR"
  enzyme: object, "The iTaq Universal SYBR Green Supermix"
  primer_forward: sample, "The forward primer"
  primer_reverse: sample, " The reverse primer"
end

take
  y = item fragment
  sybr = item enzyme
  pf = item primer_forward
  pr = item primer_reverse
end

information "qPCR of cDNA - Prep and Run"

step
  description: "Thaw Frozen Components"
