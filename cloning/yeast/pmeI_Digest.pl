##This protocol creates 50µl digests of yeast vectors to be integrated via transformation

argument
  plasmids: sample("Plasmid") array, "Plasmids"
  Plasmids_conc: number array, "Plasmid DNA Concentrations in ng/µl"
  pmei: sample("Enzyme"), "Tube of PMEI to be used."
  bsa: sample("Enzyme Buffer Stock"), "Tube of BSA to be used"
  NEB4: sample("Enzyme Buffer Stock"), "Tube of NEB Buffer 4 to be used."
end

take
  N4 = item NEB4
  bsa_stock = item bsa
  plasmid_stocks = item unique(plasmids)
end

step
  description: "In the following step you will take PMEI enzyme out of the freezer. Make sure the enzyme is kept on ice for the duration of the protocol."
end

take
  pmei_stock = item pmei 
end

step
  
end
