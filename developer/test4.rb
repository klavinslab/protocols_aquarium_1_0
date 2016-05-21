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
    yeast_strains.each do |yeast_strain|
      description = yeast_strain.description
      if description
        if description.include? "QC_length"
          length = description.split('QC_length')[-1].split(':')[-1].to_i
          yeast_strain.set_property "QC_length", length
          yeast_strain.save
          changes.push "#{yeast_strain} QC_length changed"
        end
        if description.include? "comp_cell_limit: no"
          yeast_strain.set_property "Comp_cell_limit", "No"
          yeast_strain.save
          changes.push "#{yeast_strain} Comp_cell_limit changed"
        end
      end
    end
    show {
      note yeast_strains.length
      note changes.length
    }
    return changes
  end
end
