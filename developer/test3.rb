class Protocol

  def purchase_info ot

    if ot.object_type[:materials] && ot.object_type[:labor]
      "basic"
    elsif ot.handler == "sample_container" && ot.object_type[:samples]
      "sample"
    elsif ot.handler == "collection" && ot.object_type[:samples]
      "collection"
    else
      nil
    end

  end

  def main

    basics = ObjectType.all.select { |ot|
      purchase_info ot == "basic"
    }

    samples = ObjectType.all.select { |ot|
      purchase_info ot == "sample"
    }

    collection = ObjectType.all.select { |ot|
      purchase_info ot == "collection"
    }

    show do
      ots.each do |ot|
        note ot.name
      end
    end

  end

end
