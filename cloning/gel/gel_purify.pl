#Gel purify protocol


argument
  GelSlice_id: sample("Gel Slice") array, "Fragment"
end

take
  slices = item unique(GelSlice_id)
end

step
  description: "This protocol purifies DNA fragments from gel slices"
end

y=length(GelSlice_id)


step
  description: "Zero the scale with an empty 1.5 ml eppendorf tube"
  check: "weigh each gel slice tube on the scale and record it's weight on the side of the tube"
end


step
  desciption: "Add 3 times the weight in volume of buffer QG from the quiagen gel purify kit into each weighed gel slice tube"
end

step
  description: "Place tubes in 50 degree heat block for 10 minutes. Vortex every few minutes to speed up the process"
end

step
  description: "Add tube contents to LABELED pink Qiagen columns"
  note: "be sure to add a maximum of 750µl to each pick columns"
end

step
  description: "Spin at top speed (> 17,900 g) for 1 minute to bind DNA to columns"
  note: "after spin empty collection columns"
end

step
  check: "Add 750 uL PE buffer to columns and wait five minutes"
  check: "Spin at top speed (> 17,900 g) for 30 seconds to wash columns."
  check: "Empty collection tubes."
  check: "Add 500 uL PE buffer to columns and wait five minutes"
  check: "Empty collection tubes."
  check: "Spin at top speed (> 17,900 g) for 30 seconds to remove all PE buffer from columns"
end

step
  desciption: "Label 1.5 ml Eppendorf tubes. Transfer pink columns to empty Eppendorf tubes"
end

step
  check: "Add 30 uL molecular grade water or EB elution buffer to center of column."
  note: "Be very careful to not pipette on the wall of the tube"
  check: "Wait two minutes"
  check: "Elute DNA into Eppendorf tubes by spinning at top speed (> 17,900 xg) for one minute"
end




count=0
  while count < y 
    slice = slices[count]
      produce
        q=1 "Fragment Stock" from slice
        location: "Benchtop"
      end
  count=count+1
end

  
release(slices)
