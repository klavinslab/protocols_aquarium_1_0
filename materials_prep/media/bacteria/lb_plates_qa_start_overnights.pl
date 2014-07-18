# (Protocol 1): streaking

# FIXME: there should be arguments for the strains to use for each antibiotic
# and the metacol should have them hard-coded
#
# IDEA: use data fields to track whether plates have been QA'd?
#       downside: all 'takes' that ask for a sterile LB Amp Plate would have
#       to be modified, would then be overcomplicated

# Grab plates that need to be QA'd
plates_to_qa = ["LB Amp Plate (sterile) pre-QA",
                "LB Kan Plate (sterile) pre-QA",
                "LB Chlor Plate (sterile) pre-QA"]

antibiotic_list = []

amp_ot = find(:object_type, { name: "LB Amp Plate (sterile) pre-QA" })
amp_ot_id= amp_ot[0][:id]
amp_items = find(:item, { object_type_id: amp_ot_id })
amp_ids = []
i = 0
while i < length(amp_items)
  amp_ids = amp_items[i][:id]
  antibiotic_list = append(antibiotic_list, "Amp")
end

kan_ot = find(:object_type, { name: "LB Kan Plate (sterile) pre-QA" })
kan_ot_id= kan_ot[0][:id]
kan_items = find(:item, { object_type_id: kan_ot_id })
kan_ids = []
i = 0
while i < length(kan_items)
  kan_ids = kan_items[i][:id]
  antibiotic_list = append(antibiotic_list, "Kan")
end

chlor_ot = find(:object_type, { name: "LB Chlor Plate (sterile) pre-QA" })
chlor_ot_id= chlor_ot[0][:id]
chlor_items = find(:item, { object_type_id: chlor_ot_id })
chlor_ids = []
i = 0
while i < length(chlor_items)
  chlor_ids = chlor_items[i][:id]
  antibiotic_list = append(antibiotic_list, "Chlor")
end

all_plate_ids = concat(concat(amp_ids, kan_ids), chlor_ids)

# TODO: will explode if there's no plates - catch that? take arguments?
step
  description: "Label plates as you grab them"
  note: "At the next step, you will be asked to grab plates. On the bottom of each plate, write batch ##### near the edge, where ##### is the id of the plate."
end

take
  all_plates = all_plate_ids
end

# For each type of antibiotic, take out a strain that resists it
# FIXME: Just use iGEM plasmids: pSB1C3, pSB1A3, pSB3K3 - get them from iGEM repo.
#   There weren't ideal candidates in the current aquarium database - just as much work to get the standard plasmids in our database.
amp_strain = 100
amp_strain_sample = find(:sample, { id: amp_strain })
amp_strain_item = amp_strain_sample[0][:id}
strain_hash = merge(strain_hash, { amp: amp_strain_item })
kan_strain = 101
kan_strain_sample = find(:sample, { id: kan_strain })
kan_strain_item = kan_strain_sample[0][:id}
strain_hash = merge(strain_hash, { amp: kan_strain_item })
chlor_strain = 102
chlor_strain_sample = find(:sample, { id: chlor_strain })
chlor_strain_item = chlor_strain_sample[0][:id}

strain_hash = {}
strain_hash = merge(strain_hash, { amp: chlor_strain_item })

strain_item_ids = []
strain_item_ids = append(strain_item_ids, amp_strain_item)
strain_item_ids = append(strain_item_ids, kan_strain_item)
strain_item_ids = append(strain_item_ids, chlor_strain_item)
# FIXME: append to strain_hash with the strain id

# Find MG1655 (no resistance) strain plate
mg1655_sample = find(:sample, { name: "MG1655" })
mg1655_id = mg1655_sample[0][:id}
mg1655_item_id = find(:item, { sample_id: mg1655_id })

strain_ids = concat(strains, mg1655_item_id)

take
  strains = item strain_ids
end

# Divide plate into two sectors, label as 'positive' and 'negative'. Label with the id of the batch.
step
  description: "Sector Plates"
  note: "Divide each plate into two sectors by drawing a line through the middle with a black marker. Label one half as '+' (positive control) and one as '-' (negative control)."
end

# For each type of antibiotic, streak out resistant strain, non-resistant strain
i = 0
while i < length(all_plate_ids)
  current_id = all_plate_ids[i]
  current_antibiotic = antibiotic_list[i]
  positive_strain = strain_hash[current_antibiotic]
  negative_strain = mg1655_item_id

  step
    description: "Streak strains onto plate %{current_id}:"
    check: "Positive (+) side: %{positive_strain}"
    check: "Negative (-) side: %{negative_strain}"
  end

  i = i + 1
end

# Put control plate(s) in the incubator
i = 0
while i < length(all_plate_ids)
  current_plate = all_plate_ids[i]

  produce
    new_plate = 1 "QA Plate"
    note: "This is for the 'batch %{current_plate}' plate."
  end

  i = i + 1
end

# Put back control strains
return concat(concat(amp_strain, kan_strain), chlor_strain)

# Move entire batch of plates from 'to be QA'd' section to 'being QA'd' section
