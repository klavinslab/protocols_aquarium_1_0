needs "aqualib/lib/standard"
needs "protocols/mutagenesis_workflow/lib/cloning"

class Protocol

  include Standard
  include Cloning

  def debug
    false
  end

  def main

    items = find(:item, { sample: { name: "pLAB1" }, object_type: { name: "Plasmid Stock" } } )
    take(items, interactive: true, method: "boxes") {
      warning "Do not leave the freezer open too long!"
    }

    items_by_id = find(:item, id: 761)
    items = find(:item, object_type: {name: "GelGreen Nucleic Acid Stain"})

    take items_by_id, interactive: true

    gel_green = choose_object "500 mL Bottle"

  end

end












