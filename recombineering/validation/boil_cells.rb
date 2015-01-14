needs "protocols/recombineering/lib/ctutility"

class Protocol
  include CTUtility
  def debug
    true
  end

  def arguments
    { overnight_ids: [14947,14948,13992,13993] }
  end
  def main
    oNight_ids = input[:overnight_ids]
    overnights= take_by_id(oNight_ids,true) #take overnights

    show {
      title "Prepare #{overnights.length} 1.5 mL centrifuge tubes"
      note "place #{overnights.length} 1.ml centrifuge tubes in a a rack and 
             label them 1 through #{overnights.length}"
    }

    tbl = [["source tube","destination tube"]]
    tube_no=0
    overnights.each do |overnight|
      tube_no = tube_no +1
      tbl << [overnight.id,tube_no]
    end
    
    show {
      title "Transfer 500 &micro;L from the source tube to the destination tube."
      table tbl
    }

    release(overnights,interactive: true)

    nwash = 2
    while nwash >0 do
      show {
        title "Centrifuge tubes 1-#{overnights.length} at above 10,000g for 1 min"
      }
      show {
        title "remove the supernatant and resuspend"
        note "For each tube, pour or pipette off the supernatant and resuspend
          the cells in 1 mL of molecular grade water from an aloquote."
      }
      nwash = nwash - 1
    end

    n_stripwell = overnights.length/12+1
    onight_samples = overnights.map{|x| x.sample}

    labels = ["A"]
    label = labels[0]
    while labels.length<n_stripwell do
      labels.append label.next!
    end

    show {
      title "take #{n_stripwell} stripwells"
      note "take #{n_stripwell} stripwell tubes and label each strip according
      to the table below:"
      table [labels]
    }

    ii = 0
    move_table = [["1.5ml tube","stripwell","position"]]
    while ii<overnights.length do
      sw = ii/12
      pos = ii%12+1
      move_table.push([ii+1,labels[sw],pos.to_s])
      ii=ii+1
    end

    show {
      title "Transfer to strip well tubes."
      note "transfer 100 &micro;L from tubes 1-#{overnights.length} to the 
        stripwell according to the table below."
      table move_table
    }
 
    show {
      title "Boil cells"
      note "Place the strip wells into a free thermocycler and find a protocol 
          labeled boil.  Adjust parameters to 95C and 5 min if necessary."
      note "while you wait:"
      check "discard any 1.5ml tubes you may still have laying around"
      check "label #{overnights.length} new 1.5 mL centrifuge 
        tubes 1 through #{overnights.length}."
    }

    show {
      title "Transfer back to centrifuge tubes."
      note "Transfer the entire contents (100 &micro;L) of each strip well 
        into the tubes you just labeled according to the following table:"
      table move_table
    }

    genomes = []
    overnights.each do |x|
      genomes.append produce x.sample.make_item "Genome Prep"
    end

    tube_ids = genomes.map {|x| x.id.to_s}

    show {
      title "Spin at max RPM for 2 min"
      note "Spin the 1.5ml tubes you just transferred at max RPM in the 
      centrifuge"
      note "while you wait:"
      check "label #{overnights.length} 1.5 mL centrifuge tubes according to
        the following table:"
      table [tube_ids]
    }

    gp_table = (Array (1..tube_ids.length)).zip(tube_ids)

    show {
      title "CAREFULLY transfer supernatant to new tubes"
      note "Very carefully, with minimal shock or vibration 
        (pretend it's nitroglycerin), remove each tube from the centrifuge and 
        transfer 50 &micro;L off the top to the tube you just labeled according
        to the following table"
      warning "Becareful not to disturb the pellet.  We don't want any of the 
      pellet, which may be tiny, fragile, and invisible."
      table gp_table
    }

    release genomes, interactive: true

  end
end