needs "aqualib/lib/standard"
needs "aqualib/lib/cloning"

class Protocol

  include Standard
  include Cloning

  def arguments
    {
    }
  end

  def main
    yeast_strains = find(:sample, { sample_type: { name: "Yeast Strain" } })
    changes = []
    i = 0
    yeast_strains.each do |yeast_strain|
      if i < 5
        description = yeast_strain.description
        if description
          if description.include? "QC_length"
            length = description.split('QC_length')[-1].split(':')[-1].to_i
            yeast_strain.set_property "QC_length", length
            yeast_strain.save
            changes.push "#{yeast_strain} QC_length changed"
          end
          if description.include? "comp_cell_limit: no"
            r = yeast_strain.set_property "Comp_cell_limit", "No"
            if r
              changes.push "#{yeast_strain.id} Comp_cell_limit changed"
            else
              changes.push "Could not change Comp_cell_limit for #{yeast_strain.id}"
            end
          end
        end
      end
      i += 1
    end
    show {
      note yeast_strains.length
      note changes.length
    }
    return changes
  end
end
