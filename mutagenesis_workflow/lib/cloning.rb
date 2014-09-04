module Cloning

  def fragment_info fid

    fragment = find(:sample,{id: fid})[0]# Sample.find(fid)
    props = fragment.properties

    fwd = props["Forward Primer"]
    rev = props["Reverse Primer"]
    template = props["Template"]
    length = props["Length"]

    if fwd == nil || rev == nil || template == nil

      return nil

    else

      fwd_items = fwd.in "Primer Aliquot"
      rev_items = rev.in "Primer Aliquot"
      template_items = template.in "Plasmid Stock"

      if fwd_items.length == 0 || rev_items.length == 0 || template_items.length == 0

        return nil

      else

        t1 = fwd_items[0].sample.properties["T Anneal"] || 72
        t2 = rev_items[0].sample.properties["T Anneal"] || 72

        template_length = template_items[0].sample.properties["Length"]
        conc = template_items[0].datum[:concentration]
 
        return {
          fragment: fragment,
          length: length,
          fwd: fwd_items[0],
          rev: rev_items[0],
          template: template_items[0],
          template_length: template_length,
          conc: conc,
          tanneal: (t1+t2)/2.0,
          props: props
        }

      end

    end

  end

  def load_samples_variable_vol headings, ingredients, collections # ingredients must be a string or number

    raise "Empty collection list" unless collections.length > 0

    heading = [ [ "#{collections[0].object_type.name}", "Location" ] + headings ]
    i = 0

    collections.each do |col|
      
      tab = []
      m = col.matrix

      (0..m.length-1).each do |r|
        (0..m[r].length-1).each do |c|
          if i < ingredients[0].length
            if m.length == 1
              loc = "#{c+1}"
            else
              loc = "#{r+1},#{c+1}"
            end
            tab.push( [ col.id, loc ] + ingredients.collect { |ing| { content: ing[i], check: true } } )
          end
          i += 1
        end
      end

      show {
          title "Load #{col.object_type.name} #{col.id}"
          table heading + tab
        }
    end

  end

end
