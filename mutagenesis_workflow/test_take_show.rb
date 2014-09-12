needs "aqualib/lib/standard"
needs "protocols/mutagenesis_workflow/lib/cloning"

class Protocol

  include Standard
  include Cloning

  def debug
    true
  end

  def main

    items = find(:item, { sample: { name: "pLAB1" }, object_type: { name: "Plasmid Stock" } } )
    # take(items, interactive: true, method: "boxes") {
    #   warning "Do not leave the freezer open too long!"
    # }

    take(items, interactive: true)

  end

end












