needs "aqualib/lib/standard"
needs "protocols/mutagenesis_workflow/lib/cloning"

class Protocol

  include Standard
  include Cloning

  def debug
    true
  end

  fragment = find(:sample,{id: 2048})[0]
  props = fragment.properties
  template = props["Template"]
  length = props["Length"]

  def main
  	show {
  		note "length is #{length}"
  		note "template is #{template.name}"
  	}
  end



end












