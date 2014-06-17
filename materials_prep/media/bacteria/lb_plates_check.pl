argument
  plate_ids: sample array, "Plates to check"
  growth_ids: sample array, "IDs of strains that should grow"
end

take
  plates = item plate_ids
end

n = length(plate_ids)

grew_list = []
i = 0
while i < n
  current_plate = plate_ids[i]
  current_growth = growth_ids[i]

  step
    description: "View plate %{current_plate}"
    note: "The sector with strain %{current_growth} should have growth. All other sectors should not."
    getdata
      grew: string, "Did the plate match the above description (yes or no)?"
    end
  end

  grew_list = append(grew_list, grew)

  i = i + 1
end

log
  return: {grew: grew_list}
end

release plates
