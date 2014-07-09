# (Protocol 1): streaking

# IDEA: use data fields to track whether plates have been QA'd?
#       downside: all 'takes' that ask for a sterile LB Amp Plate would have
#       to be modified, would then be overcomplicated

# Grab plates that need to be QA'd
plates_to_qa = ["LB Amp Plate (sterile) pre-QA",
                "LB Kan Plate (sterile) pre-QA",
                "LB Chlor Plate (sterile) pre-QA"]

amp_ot = find(:object_type, { name: "LB Amp Plate (sterile) pre-QA" })
amp_ot_id= amp_ot[0][:id]
amp_items = find(:item, { object_type_id: amp_ot_id })
amp_ids = []
i = 0
while i < length(amp_items)
  amp_ids = amp_items[i][:id]
end

kan_ot = find(:object_type, { name: "LB Kan Plate (sterile) pre-QA" })
kan_ot_id= kan_ot[0][:id]
kan_items = find(:item, { object_type_id: kan_ot_id })
kan_ids = []
i = 0
while i < length(kan_items)
  kan_ids = kan_items[i][:id]
end

chlor_ot = find(:object_type, { name: "LB Chlor Plate (sterile) pre-QA" })
chlor_ot_id= chlor_ot[0][:id]
chlor_items = find(:item, { object_type_id: chlor_ot_id })
chlor_ids = []
i = 0
while i < length(chlor_items)
  chlor_ids = chlor_items[i][:id]
end

all_plate_ids = concat(concat(amp_ids, kan_ids), chlor_ids)

# FIXME: will explode if there's no plates
take
  all_plates = all_plate_ids
end

# Take the plates, if applicable
amp_plates = []
if length(amp_ids) > 0
  take
    amp_plates = item amp_ids
  end
end

kan_plates = []
if length(kan_ids) > 0
  take
    kan_plates = item kan_ids
  end
end

chlor_plates = []
if length(chlor_ids) > 0
  take
    chlor_plates = item chlor_ids
  end
end

# For each type of antibiotic, take out a strain that resists it

# Take MG1655 (no resistance) or DH5alpha

# Divide plate into two sectors, label as 'positive' and 'negative'. Label with the id of the batch.

# For each type of antibiotic, streak out resistant strain, non-resistant strain

# Put control plate(s) in the incubator

# Put back control strains

# Move entire batch of plates from 'to be QA'd' section to 'being QA'd' section



# (Protocol 2): analysis

# Take out control plate(s)

# If positive has no growth or negative has no growth, dispose of the entire batch and delete from the inventory
# Otherwise, move batch from 'being QA'd' section to the proper 'ready to use' section
