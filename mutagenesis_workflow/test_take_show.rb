needs "aqualib/lib/standard"
needs "protocols/mutagenesis_workflow/lib/cloning"

class Protocol

  include Standard
  include Cloning

  def debug
    true
  end

  def main

    fragment = find(:sample,{id: 2048})[0]
    take (fragment, interactive: true,  method: "boxes") {
      warning "Do not leave the freezer open too long!"
    }
  end

end












