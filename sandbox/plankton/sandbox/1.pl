
  ################################### 
  # Example 1 : A Plankton Protocol 
  #

  argument
    x: string array, "Name"
    y: number array, "Masses"
    z: sample array, "Sample type"
    q: object, "Container"
  end

  m = y[0]
  n = m+y[0]

  step

    description: "The first step"

    note: "x = %{x}."
    note: "y = %{y}."
    note: "z = %{z}."
    note: "q = %{q}."

    warning: "Careful!"

  end

  take
    x = item z[0]
  end

  c = x[0][:data][:concentration]

  step
    description: "%{x} = > %{c}"
  end

  n = n+1

  step
    description: "The second step"
    note: "Now n = %{n}."
  end

  release x
