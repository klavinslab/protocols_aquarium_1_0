argument
  overnights: sample array, "plates to pick"
end

take
  onights = item unique(overnights)
end 

ntubes = length(overnights)
step
  description: "Prepare %{ntubes} 1.5 mL centrifuge tubes "
  note: "Place %{ntubes} 1.5mL centrifuge tubes in a rack and label them 1 throguh %{ntubes}"
end 

ii = 0
tbl = [["source tube","destination tube"]]
while ii<ntubes
  tbl = append(tbl,[overnights[ii],ii+1])
  ii = ii +1
end

step
  description: "Transfer 500 &micro;L from source tube to destination tube."
  table: tbl
end 

release onights

step
  description: "Centrifuge tubes 1-%{ntubes} at above 10,000g for 1min"
end

step
  description: "Remove supernatant and resuspend"
  note: "For each tube pour or pipette off the supernatant and resuspend the cells in 1 mL of molecular grade water from an aloquote."
end

step
  description: "Centrifuge tubes 1-%{ntubes} at above 10,000g for 1min"
end

step
  description: "Remove supernatant and resuspend"
  note: "For each tube pour or pipette off the supernatant and resuspend the cells in 500 &microL of molecular grade water from an aloquote."
end

step
  description: "Transfer to a PCR strip well tube."
  note: "transfer 100&microL from tubes 1-%{ntubes} to wells 1-%{ntubes} marking them appropriatly and using additional strips if necesarry.  Throw out the centrifuge tubes and remaning cells once you're done with this step" 
  warning: "It is important to transfer 1 to 1, 2 to 2 etc so that samples don't get confused"
end

step
  description: "Boil cells"
  note: "Place the strip wells into a free thermocycler and find a protocol labeled boil.  Adjust parameters to 95C and 5 min if necessary."
  check: "while you wait, label %{ntubes} new 1.5 mL centrifuge tubes 1-%{ntubes}"
end

step
  description: "Transfer back to centrifuge tubes"
  note: "Transfer the entire contents (100 &micro;L) of each strip well into the tubes you just labeled.  Again well 1 goes to tube 1, 2 to 2, etc.  Discard the strip wells when you're done."
end

genomepreps = []
GPIDs = []
locs = []

foreach sample in onights
  produce silently
    gp = 1 "Genome Prep" from sample
    data
      from: sample[:id]
    end
  end
  genomepreps = append(genomepreps,gp)
  GPIDs = append(GPIDs,gp[:id])
  modify
    gp
    inuse: 1
  end
end


step
  description: "Centrifuge the tubes at max speed for 2 min. "
  check: "while you wait, label yet another set of 1.5 mL centrifuge with item numbers from the table below"
  table: [GPIDs]
end

step
  description: "Carefully retrieve tubes and place them in a tube rack"
  warning: "When removing the tubes from the centrifuge the pellets will be incredibly delecate.  Move slowly and deliberatly."
end

tbl = [["source tube", "destination tube"]]
ii = 0 
while ii<ntubes
  tbl = append(tbl,[ii+1,GPIDs[ii]])
  ii = ii+1
end

step
  description: "Transfer supernatent to the new tubes"
  note: "According to the table below, remove 30 &micro;L of the SUPERNATANT from the source tube and transfer it to the destination tube."
  table: tbl
end

release genomepreps

fragment_names = []
foreach g in GPIDs
  fragment_names = append(fragment_names,"recombineering assay fragment")
end

log
  return: {gen_preps: GPIDs, frag_names: fragment_names}
end




