needs "aqualib/lib/standard"
needs "aqualib/lib/cloning"

class Protocol

  include Standard
  include Cloning

  def main
      
    yeast_strains = find(:sample, { sample_type: { name: "Yeast Strain" } })
    changes = []
    
    yeast_strains.each do |yeast_strain|
        
      description = yeast_strain.description
      
      if description
          
        if description.include? "QC_length"
          length = description.split('QC_length')[-1].split(':')[-1].to_i
          yeast_strain.set_property "QC_length", length
          if yeast_strain.errors.empty?
            changes.push "#{yeast_strain.id} Comp_cell_limit changed"
          end
        end
        
        if description.include? "comp_cell_limit: no"
          r = yeast_strain.set_property "Comp_cell_limit", "No"
          if yeast_strain.errors.empty?
            changes.push "#{yeast_strain.id} Comp_cell_limit changed"
          end
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
