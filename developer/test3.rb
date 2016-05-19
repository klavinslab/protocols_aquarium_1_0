class Protocol

  def purchase_info ot

    if ot.data_object[:materials] && ot.data_object[:labor]
      "basic"
    elsif ot.handler == "sample_container" && ot.data_object[:samples]
      "sample"
    elsif ot.handler == "collection" && ot.data_object[:samples]
      "collection"
    else
      nil
    end

  end

  ###########
  # TODO: 
  #   - Choose purchase type
  #   - Choose specific object and/or sample
  #   - For a given object type / sample, find all items available to purchase
  #   - Choose the particular item
  #   - Create a task to enable the purchase (will need a new task prototype)
  #

  def main

    basics = ObjectType.all.select { |ot|
      purchase_info(ot) == "basic"
    }

    samples = ObjectType.all.select { |ot|
      purchase_info(ot) == "sample"
    }

    collections = ObjectType.all.select { |ot|
      purchase_info(ot) == "collection"
    }

    show do
      title "Basic Items"
      basics.each do |ot|
        note ot.name
      end
    end

    show do
      title "Individual Samples"
      samples.each do |ot|
        note ot.name
      end
    end

    show do
      title "Batched samples"
      collections.each do |ot|
        note ot.name
      end
    end

  end

end
