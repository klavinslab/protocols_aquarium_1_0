class Protocol

  def main

    ots = ObjectType.all.select { |ot|
      ot.data_object.purchasable
    }

    show do
      ots.each do |ot|
        note ot.name
      end
    end

  end

end
