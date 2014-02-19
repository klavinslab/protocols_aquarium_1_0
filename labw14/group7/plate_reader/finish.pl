step
  description: "Finishing up with the plate reader"
  check: "You should be working near the 'Biotech Synergy HT' plate reader at location B9.355"
  check: "You should be completing an assay run with the 'Biotech Gen5 1.11 program' on the accompanying computer"
end

step
  description: "Export your data"
  check: "Run the 'File Export Builder' wizard to export your plate reader data"
  check: "Save the data to 'My Documents\yyyymmdd MyExperimentName.txt'"
end

step:
  description: "Clean up your station"
  check: "Clean up your 96 well assay plate" #not sure of procedure for this yet...
  check: "Shut down the 'Biotech Synergy HT' plate reader"
  #anything else here?
end
