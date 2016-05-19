class Protocol

  def main

    ot_names = ObjectType.all.collect { |ot|
      ot.name
    }

    show do
      ot_names.breach do |name|
        note name
      end
    end

  end

end
