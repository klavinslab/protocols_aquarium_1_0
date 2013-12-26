take
  bottle = 1 "1 L Bottle"
end

item_name = bottle[0][:name]
item_id = bottle[0][:id]
# Note: as of 20131226, if the data field is missing from the item it throws a json error ("{:error=>"Could not parse json data"}.)
item_data = bottle[0][:data]

step
  description: "Item information"
  note: "Item name is %{item_name}.\nItem id is %{item_id}.\nItem data is %{item_data}."
end

release bottle
