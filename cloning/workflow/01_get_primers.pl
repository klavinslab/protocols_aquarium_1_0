argument
  primer_ids: sample("Primer") array, "Primers that you are expecting today at the Biochem store"
  names: string array, "Name(s) of the person/people on the order(s)"
end

step
  description: "Call the biochem store to see if primers have arrived."
  check: "On the lab phone, dial 31728"
  check: "If someone answers, politely ask the following: 'Hi, I am calling from the Klavins lab and was wondering if primers have arrived for %{names}?"
  getdata
    answer: string, "Did anyone answer?", [ "Yes", "No"]
    arrived: string, "Did any primers arrive?", [ "Yes", "No", "They did not answer..." ]
  end
end


release plasmid_stock

x=0
while x < y
  produce
    q = 1 "PCR Result" of fragment_names[x]
    location: "Thermocycler"
  end
  x = x+1
end
