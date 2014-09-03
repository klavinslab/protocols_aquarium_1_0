step
  description: "Retreive the box labled 'Trash Box' located at B14.320"
end

item_no = 1

while item_no>0

  step
    description: "Grab something out of the box and enter its ID below."
    note: "If the box is empty leave the field blank"
    getdata
      item_no: number, "Enter the item ID"
    end 
  end

  if item_no>0

    step
      description: "Is item no: %{item_no} correct?"
      getdata
        confirm: string, "enter yes or no"
      end
    end

    if confirm == "yes"
      the_item = find(:item,{id: item_no})
      the_samp_id = the_item[0][:sample_id]
      modify 
        the_item[0]
        location: "deleted"
        inuse: -1 
        quantity: -1
      end
  
      step
        description: "Throw item %{item_no} into the biohazard bin"
      end
    end

  end

end
  

