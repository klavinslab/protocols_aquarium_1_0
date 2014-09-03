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
    props = fragment.properties
    url = props["Sequence"]
    length = props["Length"]
    template = props["Template"]    
    fwd = props["Forward Primer"]
    rev = props["Reverse Primer"]
  	show {
  		note "url is #{url}"
  		note "length is #{length}"
  		note "template is #{template.name}"
  		note "fwd is #{fwd.name}"
  		note "rev id is #{rev.id}"
  		note "props is #{props}
  	}
  end

end












