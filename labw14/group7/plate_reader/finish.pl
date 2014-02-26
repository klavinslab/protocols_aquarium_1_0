step
  description: "Finishing up with the plate reader"
  check: "You should be working near the 'Biotech Synergy HT' plate reader at location B9.355"
  check: "You should be completing an assay run with the 'Biotech Gen5 1.11 program' on the accompanying computer"
end

step
  description: "Confrm the run is complete"
  note: "You should be finished with the whole 36hour run a this point.  If you still have a little time left, wait until the run is compplete before proceeding"
end

step
  description: "Export your data"
  check: "Run the 'File Export Builder' wizard to export your plate reader data"
  check: "Save the data to 'My Documents\yyyymmdd MyExperimentName.txt'"
end

step
  description: "Tidy up"
  check: "Dispose of your 96 well assay plate into a red biological waste bin"
  check: "Shut down the 'Biotech Synergy HT' plate reader"
  check "Close out the 'Gen5' software (quit to desktop)"
  check: "Clean up any mess in your station"
  #anything else here?
end
