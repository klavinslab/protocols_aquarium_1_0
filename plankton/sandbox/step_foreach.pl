L = [ 1, 2 ]

step
  description: "A step with a foreach and L=%{L}"
  input
    x: string, "A string"
    z: string, "Make a choice", [ "A", "B", "C" ]
  end
  image: "14ml_culture_tube"
  image: "soak_bleach"
  foreach i in L
    note: "This is note " + "%{i}"
    foreach j in [ "a", "b" ]
      check: "This is checkbox " + to_string([i,j])
    end
  end
end
