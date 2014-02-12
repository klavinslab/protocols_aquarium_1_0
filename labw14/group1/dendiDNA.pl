step
  description: "This protocal provides the procedure to denature and dilute the extracted DNA library"
end

step
  description: "Select the approximate concentraton of your DNA library"
  getdata
    C: string, "", ["4nM or greater", "approx 2nM"]
  end
end

x = 0

  if C == "4nM or greater"
    x = 2;
  elsif C == "approx 2nM"
    x = 1;
  end
t = x*10

step
 description: "Prepare the denatured library"
 

 
 check: "Lable a 1.5mL microcentrifuge tube with the date and your initials"
 check: "Pipette 5uL of the DNA sample into the tube"
 check: "Pipette 0.2ul 0.4 N NaOH into the tube"
 check: "Vortex the tube briefly to mix"
 warning: "Make sure your NaOH was prepared during the last 12 hours"
end

step
  description: "Centrifuge your sample to 280 xg for 1 minute"
  warning: "Do not proceed to the next step until after centrifuging"
end

step
  description: "After cenrifuging, let your sample incubate at room tempurature for 5 minutes"
  timer: {hours: 0, minutes: 5, seconds: 0}
end

step
  description: "Add 990uL pre-chilled HC1 to the sample tube"
  note: "Place the tube on ice to keep cold"
end

step
  description: "Dilute the DNA sample to the desired concentration"
  note: "Your starting concentration is %{t} pM"
  check: "Lable a new 1.5mL microcentrifuge tube with the date and your initials"
  check: "Add quantities to the new tube as desired using the example image."
  check: "Place the denatured and diluted DNA on ice"
  image: "http://bioturk.ee.washington.edu:3012/files/304"
  image: "http://bioturk.ee.washington.edu:3012/files/305"
end

produce
 r = 1 "Diluted Denatured DNA library in 1mM NaOH"
 
 note: "Place the tube on ice until you need it again"
end
