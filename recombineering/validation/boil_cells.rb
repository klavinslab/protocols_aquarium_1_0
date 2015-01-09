class Protocol
  def take_by_id (items_list,interactive = false)
    taken = []
    items_list.uniq.each do |an_id|
      f = find(:item, id: an_id)
      if f.length == 1
        taken.concat f 
      end
      #TODO: error checking for taknig items that don't exist
    end
    take taken, interactive: interactive
    return taken
  end

  def arguments
    { overnight_ids: [0] }
  end
  def main
    ON_ids = input[:overnight_ids]
    overnights= take_by_id(ON_ids,true) #take overnights

    show {
      title "Prepare #{overnights.length} 1.5 mL centrifuge tubes"
      note: "place #{overnights.length} 1.ml centrifuge tubes in a a rack and 
             label them 1 through #{overnights.length}"
    }

    tbl = [["source tube","destination tube"]]
    tube_no=0
    overnights.each do |overnight|
      tube_no = tube_no +1
      tbl << [overnight,tube_no]
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

    show {
      title "Transfer to a PCR strip well tube."
      note "transfer 100 &micro;L from tubes 1-#{overnights.length} to wells 
        1-#{overnights.length} marking them appropriatly and using additional
        strips if necessary.  Throw out the centrifuge tubes and remaining cells
        once you're done with this step."
      warning "It is important to transfer 1 to 1, 2 to 2 so samples don't get confused"
    }
    show {
      title "Boil cells"
      note "Place the strip wells into a free thermocycler and find a protocol 
          labeled boil.  Adjust parameters to 95C and 5 min if necessary."
      check "while you wait, label #{overnights.length} new 1.5 mL centrifuge tubes 
          1-#{overnights.length}"
    }
    show {
      title "Transfer back to centrifuge tubes."
      note "Transfer the entire contents (100 &micro;L) of each strip well into 
          the tubes you just labeled."
    }
  end
end