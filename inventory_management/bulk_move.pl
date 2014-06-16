
#TODO: incremental move (different protocol)

function mvitem(theID,loc)
  results = find(:item,{id: theID})
  if length(results) > 0
    modify
      results[0]
      location: loc
    end
  end
end


argument
  items: sample array, "list of items to move "
  start: number, "start id number to move"
  final: number, "last id to move (inclusive)"
  same_dest: string, "where to move, (every sample goes to the same place"
end


while start > 0 && start <= final
  mvitem(start,same_dest)
  start = start + 1  
end


foreach iid in items
  if to_string(iid) != "" #if not nil
    mvitem(iid,samp_dest)
  end
end


step
  note: "items successfully moved to %{same_dest}"
end
