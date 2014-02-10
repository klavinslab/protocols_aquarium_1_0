step
    description: "Build a simple Lego subassembly."
  
    note: "This is a protocol that will be used to test manta's ability to record, transcode and segment sensor and vision data."
end

take
  r1 = 1 "Red brick"
  r2 = 1 "Yellow brick"
  r3 = 1 "White lego plate"
end

step
  description: "Attach the red and yellow lego to the plate."
  note: "Snap the red and yellow lego to the top side of the white plate side-by-side and centered 
         such that there is still a border of white around the bricks."
end

step
  description: "Admire your work."
  note: "You are a clever person. Reflect on what you have accomplished. Press 'Next' when finished."
end

release concat(r1,concat(r2,r3))
