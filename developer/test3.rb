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

    ots = ObjectType.all.select { |ot|
      ot.data_object[:purchasable]
    }

    show do
      ots.each do |ot|
        note ot.name
      end
    end

  end

end
