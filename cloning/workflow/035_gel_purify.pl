#Gel purify protocol


argument
  GelSlice_id: sample("Fragment") array, "Fragment"
  isop: string, "Would you like to wash your fragments with Isopropanol? Enter yes or no."
end

take
  slices = item unique(GelSlice_id)
end

step
  description: "This protocol purifies DNA fragments from gel slices"
end


y=length(GelSlice_id)


count1=0

while count1 < y
  label=count1+1
  slice = slices[count1][:id]
    step
      description: "label the %{slice} tube with a %{label}"
      note: "these labels are very important as you will use them to label different tubes in the protocol and they will define the order in which the fragment stocks are produced at the end of the protocol"
    end
  count1=count1+1
end

step
  description: "Zero the scale with an empty 1.5 ml eppendorf tube"
  check: "weigh each gel slice tube on the scale and record it's weight on the side of the tube"
end

weights=[0]


count2=0
while count2 < y
  label=count2+1
    step
      description: "enter weight in grams of tube %{label}"
        getdata
          weight: number, "enter weight in grams of tube %{label}"
        end
  end
  weights[count2]=weight
  count2=count2+1
end

count3=0
while count3 < y
  label=count3+1
  qg=weights[count3]*3000
  qg=floor(qg)
  step
    description: "Add %{qg} µl of QG buffer into tube %{label}"
  end
  count3=count3+1
end


step
  description: "Place tubes in 50 degree heat block for 10 minutes. Vortex every few minutes to speed up the process"
end

if isop=="yes"
  step
    description: "Add 1x volume (1 uL to 1 mg of gel slice) isopropanol. Pipette up and down to mix"
  end
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
  check: "Spin at top speed (> 17,900 g) for 30 seconds to wash columns"
  check: "Empty collection tubes."
end

step
  check:"Spin at top speed (> 17,900 g) for 1 minute to remove all PE buffer from columns"
end

step
  description: "Label 1.5 ml Eppendorf tubes. Transfer pink columns to empty Eppendorf tubes"
end

step
  check: "Add 30 uL molecular grade water or EB elution buffer to center of column."
  note: "Be very careful to not pipette on the wall of the tube"
  check: "Wait five minutes"
  check: "Elute DNA into Eppendorf tubes by spinning at top speed (> 17,900 xg) for one minute"
end

step
  description: "the order the fragement stocks are produced is defined by 1 through %{y}. Label them as the production steps show up"
end


count=0
  while count < y
    slice = slices[count]
      produce
        q=1 "Fragment Stock" from slice
      end
  count=count+1
end

release(slices)
