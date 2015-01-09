module CTUtility
  def take_by_id (items_list,interactive = false)
    taken = []
    items_list.uniq.each do |an_id|
      f = find(:item, id: an_id)
      if f.length == 1
        taken.concat f 
      end
      #TODO: error checking for taknig items that don't exist
    end
    take taken, interactive: interactive
    return taken
  end
end