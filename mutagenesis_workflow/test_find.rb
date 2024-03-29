class Protocol

  def main

    i1 = find(:item, object_type: {name: "GelGreen Nucleic Acid Stain"})
    i2 = find(:item, id: 374)

    show {
      title "Items"
      table i1.collect { |i| [ i.id, i.object_type.name ] }
      table i2.collect { |i| [ i.id, i.object_type.name ] }
    }

    take i2, interactive: true

  end

end