step
  description: "Go to the thermal cycler and pick up the product of the PCA."
  note: "And place the tube at your bench"
  warning: "You can keep them in -4C fridge (SF) in case you are not using them right away."
end

produce
  r = 1 "PCR Result" of "fGA"

end

log
  return: { PCR_Result_id: r[:id] }
end
