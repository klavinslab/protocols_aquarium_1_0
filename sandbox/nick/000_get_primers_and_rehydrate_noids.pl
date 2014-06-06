argument
  names: string array, "Name(s) of the person/people on the order(s) that may have arrived"
end

answer="No"
arrived="blank"
xyz=[0]
while answer=="No"
  step
    description: "Call the biochem store to see if primers have arrived."
    check: "On the lab phone, dial 31728"
    check: "If someone answers, politely ask the following: 'Hi, I am calling from the Klavins Lab and was wondering if primers have arrived for %{names}?"
    getdata
      answer: string, "Did anyone answer?", [ "Yes", "No" ]
      arrived: string, "Did any primers arrive?", [ "Yes", "No", "They did not answer..." ]
    end
  end
  if answer=="No"
    step
      description: "Wait 15 minutes"
    end
  end
end

if arrived=="Yes"
  step
    description: "Go to the biochem store and pick up all of the Klavins Lab primers"
    getdata
      num: number, "How many primers did you pick up?"
    end
  end
  step
    description: "Put a small circular sticker on the lid of each primer tube"
  end
  x=0
  id=0
  ids=[0]
  while x<num
    step
      description: "Grab any primer that has not yet been labeled for information entry and rehydration"
      note: "Find its entry in the Primers section of the Aquarium Sample Inventory and locate its newest (highest-ID) Primer Stock item."
      getdata
        id: number, "Enter the primer ID number you found."
        moles: number, "Enter the number of moles of primer in the tube, in nm. This is written toward the bottom of the tube, below the MW."
      end
      check: "Write the primer ID number on the sticker attached to the top of the tube"
    end
    ids[x]=id
    vol=moles*10
    step
      description: "Rehydrate the primer"
      check: "Add %{vol}ul of TE to the primer tube"
      check: "Put the cap back on, and flick the tube many times to mix"
    end
    x=x+1
  end
  step
    description: "Ignore the following 'take'"
  end
  take
    xyz = item ids
  end
  step
    description: "Do NOT ignore the following 'release'"
  end
  release xyz
else
  step
    description: "There are no primers to pick up"
  end
end

