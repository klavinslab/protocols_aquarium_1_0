argument
  primer_f: sample array, "forward primer list"
  primer_r: sample array, "reverse primer list"
  #plasmid_id: sample, "The plasmid stock"
  enzyme_id: sample, "The Phsion HF Master Mix stock"
end

num_samples = length(primer_f)

take
  #plasmid_stock = item plasmid_id
  #phusion_stock = 1 "Phusion HF Master Mix"
  phusion_stock = item enzyme_id
end


primer_f_items = []
primer_r_items = []

ii=0
while ii<length(primer_f)
  take
    p1 = item primer_f[ii]
    p2 = item primer_r[ii]
  end
  primer_f_items = append(primer_f_items,p1[0])
  primer_r_items = append(primer_r_items,p2[0])
  ii = ii+1
end

nPrimers = ii

step
  description: "This protocol prepares the PCR mix in
    PCR tube and starts it in thermal cycler."
end

nFragments = 5
First = 1
Last = nFragments

bFirst = 1
bLast = 4

step
  description: "Spin down the boiled cell tubes %{bFirst} - %{bLast} in the microcentrifuge on your bench for 1 minute"
  note: "The boiled cell %{bFirst} - %{bLast} are the PCR tubes you took from thermal cylcler from your previous protocol."
  warning: "Be extremely careful not to distrube the spun tubes.  They won't look any different but even the slightest tap can be detrimental."
end

step
  description: "Take %{nFragments} 0.2 mL PCR tubes from PCR strip. Write your initials on it. Label from left to right as %{First} to %{Last}."
end

step
  description: "Put Reaction. "
  check: "Pipet 7.5 µL molecular grade water into each of the new labeled PCR tube(%{First} to %{Last})."
end

jj = 0
t = 1
tube_number = 0
  while jj < nPrimers
    fwd = primer_f[jj]
    rev = primer_r[jj]
    #t = t%bLast
    tube_number = tube_number + 1
    step 
      description: "Prepare reaction for tube %{tube_number}"
      check: "Pipet 0.5 uL of boiled cell %{t} into tube %{tube_number}."
      check: "Pipet 1 uL of primer with id %{fwd} into tube %{tube_number}."
      check: "Pipet 1 uL of primer with id %{rev} into tube %{tube_number}."
      check: "Use the tip to gently mix."
      note: "Be careful to pipette into the liquid, not the side of the tube. Always use a new tip."
      warning: "Be extremely careful not to distrube the boiled cell tubes. They won't look any different but even the slightest tap can be detrimental."
    end
    t = t + 1
    if t > bLast 
      t = 1
    end
    jj = jj + 1
  end

step
  description: "Prepare reaction"
  check: "Pipet 10 µL of Phusion HF Master Mix with id %{enzyme_id} into each PCR tube (%{First} to %{Last})."
  note: "Use the tip to gently mix after each pipette."
end
step
  description: "Place the tubes into thermal cycler T2 at B3.335"
end

step
  description: "Choose program on the thermal cycler"
  note: "Click Home then click Saved Protocol, choose LABW14 folder, choose CLONEPCR."
  image: "thermal_cycler_home"
end

step
  description: "Hit 'run' on the thermal cycler and select 20 uL setting."
  image: "thermal_cycler_select"
end

release primer_f_items
release primer_r_items
release phusion_stock
