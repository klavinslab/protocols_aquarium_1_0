 
argument
  media: string, "The media type that is being warmed up."
  power: number, "The power level to set the microwave to."
end  

step
  description: "Insert media in microwave."
  note: "Put %{media} in Microwave M1. Make sure to loosen the cap."
end 

step
  description: "Set the time and power."
  note: "To set the cook time, press 'Cook' then '200' for 2 minutes. To set the power, press 'Power' then %{power}. Press 'Start.'"
  warning: "Keep an eye on it to make sure it does not boil over."
end

step
  description: "Swirl the media."
  note: "Using the %{gloves}, take the %{media} out of the microwave carefully. Take of the cap for a few seconds and let some heat be released. Replace the cap, and carefully swirl."
  warning: "Don't let it bubble over!"  
end 

step
  description: "Repeat this process."
  note: "Repeat this process for 1 minute 30 seconds, then 1 minute, then 1 minute, then 30 seconds, then 30 seconds until the agar is completely melted."
  warning: "This is an approximation. To check if the agar is completely melted, CAREFULLY hold the agar up to the light and swirl. If no solid agar is present, it is done."
end 
