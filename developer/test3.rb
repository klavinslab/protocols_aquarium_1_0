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
      basics.each do |ot|
        note ot.name
      end
    end

    show do
      samples.each do |ot|
        note ot.name
      end
    end

    show do
      collections.each do |ot|
        note ot.name
      end
    end

  end

end
