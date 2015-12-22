class Protocol

  def main

    o = op input

    o.input.all.take
    o.output.all.produce

    primer_ids = o.input.all.sample_ids

    show {
      title "Go the EE office to pick up primers"
      note "Abort this protocol if no primer is showed up. It will automatically rescheduled."
    }

    show {
      title "Quick spin down all the primer tubes"
      note "Find the order with sales order (or supplier ref) number #{io_hash[:order_number]}"
      note "Put all the primer tubes in a table top centrifuge to spin down for 3 seconds."
      warning "Make sure to balance!"
    }

    mw = show {
      title "Enter the MW of the primer"
      note "Enter the number of moles for each primer, in nm. This is written toward the bottom of the tube, below the MW. The id of the primer is listed before the primer's name on the side of the tube."
      primer_ids.each do |prid|
        get "number", var: "mw_#{prid}", label: "Primer #{prid}", default: 10
      end
    }

    primer_stocks = []
    primer_stocks_to_dilute = []
    primer_aliquots = []

    tab = [["Primer ids", "Primer Stock ids", "Rehydrate"]]
    
    primer_stocks = o.output.all

    primer_ids.each_with_index do |prid, idx|
      
      primer_stock = primer_stocks[idx]

      rehydrate_volume = mw[:"mw_#{prid}".to_sym] * 10
      if primer_stock.sample.properties["Anneal Sequence"][1] != "*"
        rehydrate_volume = rehydrate_volume.to_s + " µL of TE"
        primer_stocks_to_dilute.push primer_stock
      else
        rehydrate_volume = rehydrate_volume.to_s + " µL of water"
      end

      tab.push([prid, "#{primer_stock}", { content: rehydrate_volume, check: true }])

    end

    show {
      title "Label and rehydrate"
      note "Label each primer tube with the ids shown in Primer Stock ids and rehydrate with volume of TE or water shown in Rehydrate"
      table tab
    }

    if primer_stocks.length > 0
      show {
        title "Vortex and centrifuge"
        note "Wait one minute for the primer to dissolve in TE." if primer_stocks.length < 7
        note "Vortex each tube on table top vortexer for 5 seconds and then quick spin for 2 seconds on table top centrifuge."
      }
    end

    o.input.all.release
    o.output.all.release

    return o.result

  end

end
