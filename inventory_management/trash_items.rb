needs "aqualib/lib/standard"

class Protocol
  include Standard

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


  def main
    show {
      title "Retreive the box labled 'Trash Box' located at B14.320"
    }

    more_items = true
    while more_items
      data = show {
        title "Grab something out of the box and enter its ID below."
        note "If the box is empty leave the field blank."
        warning "Make sure to get the number correct."
        get "number", var: "idno", label: "Enter the item ID", default: 0
      }

      if data.nil? or data[:idno] <= 0 # check if empty, default 0 seems broken
        more_items = false
      else
        the_thing = take_by_id([data[:idno]])
        if the_thing.length == 1 #if the thing didn't exist then ignore it
          touch the_thing[0]
          the_thing[0].mark_as_deleted
        end
        show { 
          title "Throw out item #{data[:idno]}"
        }
      end

    end
  end
end