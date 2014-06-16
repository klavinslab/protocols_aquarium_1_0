
# NOTE: INCOMPLETE

function mkchild(theID,thecontainer)
  results = find(:item,{id: theID})
  if length(results) > 0
    rs = results[0]
    produce silently
      r = 1 rs[:object_type][:name] of rs[:sample][:name]
    end
    step
      note: "%{results}"
    end
  end
end


argument
  items: sample array, "list of items to move "
  start: number, "start id number to move"
  final: number, "last id to move (inclusive)"
  container: string, "sample container type"
end


while start > 0 && start <= final
  mkchild(start, container )
  start = start + 1  
end


foreach iid in items
  if to_string(iid) != "" #if not nil
    mkchild(iid,container)
  end
end


step
  note: "items successfully moved to %{same_dest}"
end
