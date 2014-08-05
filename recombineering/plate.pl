information "Spread cells onto a petri dish containing ~25mL agar media."

function array_count(arry,match) #returns number of instances of match in arry
  ii = 0
  foreach a in arry
    if a == match
      ii = ii+1
    end
  end
  return ii
end

argument
  params: generic, "not for humans"
#   e_coli_strain_id: sample array, "A sample"
#   plate_type: object, "Type of plates you will use to select for transformed cells.\nList in order of corresponding transformed E. coli strains (from the solidmedia category)"
end
e_coli_strain_id = params[:transformed_cells]
plate_type = params[:plates]

sample_count = length(e_coli_strain_id)
take
  strain = item e_coli_strain_id
  #LB     = 1 "50 mL LB liquid aliquot (sterile)"
end

plate = []
foreach p_type in unique(plate_type)
  take
    p = array_count(plate_type,p_type) p_type
  end
  plate = concat(plate,p)
end

step
  description: "took: %{plate}"
end

#TODO: replace this with a table with IDs and selection type
step
  description: "Label plates 1 to %{sample_count}"
  image: "write_on_the_plate"
end

step
  description: "Spin down cells"
  note: "Place each 1.5 mL tube (ids: %{e_coli_strain_id}) into the centrifuge and spin for 1m at 10,000g or greater."
end

step
  description: "Remove some supernatant and resuspend"
  bullet: "for each tube, remove the supernatant and add 1 mL of LB ( just plain LB)"
  bullet: "Recap each tube (if you have not already) and vortex until the cells are completely resuspended.  If the cells don't want to resuspend you may have to mix with a pipette by slowly pipetting up and down."
end
  
transformed_plates = []

step
  description: "Add beads to each plate"
  bullet: "lay out each plate on the bench agar-side up."
  bullet: "for each plate, lift off the agar side and pour 5-10 beads into the lid and replace the agarside."
  image: "pour_beads_on_plate"
end

i = 0
while i < sample_count
  plate_t = plate_type[i]
  coli_sample_id = e_coli_strain_id[i]
  current_sample = i + 1
  step
    description: "Vortex sample %{coli_sample_id}"
    note: "Vortex sample %{coli_sample_id} on vortexor."
    image: "vortex_tube"
  end
  
  step
    description: "Transfer sample %{coli_sample_id} to the center of the plate (type %{plate_t}}"
    note: "Invert plate %{current_sample} so the beads are on the agar surface. Lift the lid and pipette the entire contents of of sample %{coli_sample_id} on the agar surface and put the lid back on the plate."
    warning: "Do not place the plate lid on lab bench while you do this."
    image: "pipette_culture_on_plate"
  end

  step
    description: "Shake the plate to spread the sample over the surface."
    note: "Use 4+ gentile shakes, turn 90 degrees and repeat (keep the plate level while turning), then pour the beads out into the waste bead container.  When done, place the plate lid down on the bench in preparation for incubation."
    image: "spread_beads_on_plate"
  end

  produce
    r1 = 1 "Agar plate" from strain[i]
    location: "I1"
    data
      from: strain[i][:id]
      #original_id: strain[i][:data][:original_id]
      sampleName: params[:sampleName][i]
      verified: "no"
    end
    note: "Strike out the number on the plate and replace it with the item number above.  Place upside down in 30 C incubator at A1.110. (you can wait for all plates to be done before you transfer carry them to the incubator)"
    release [plate[i],strain[i]]
  end
  transformed_plates = append(transformed_plates, r1[:id])
  
  i = i + 1
end

log
  return: { plate_id: transformed_plates}
end
  
