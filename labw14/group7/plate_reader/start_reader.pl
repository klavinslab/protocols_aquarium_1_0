step
  description: "Start the plate reader software"
  note: "The reader takes some time to warm up, so we will start it up before you prepare your samples"
  check: "Move to the 'Biotech Synergy HT' plate reader at location B9.355"
  image: "plate_reader_closed"
end

step
  description: "Start the plate reader software"
  check: "On the accompanying computer, click the start menu, type in 'Gen5 1.11'"
  check: "Confirm that you see 'Gen5 1.11' as an option, and enter to run the 'Biotech Gen5' software"
  image: "plate_reader_start_menu"
end

step
  description: "Start up the plate reader"
  check: "In the intro pop-up menu, open the file 'Lab B Sample Run' (Look in recent files)"
  check: "Immediately go to 'File->Save As...', and save this into a new file name"
  note: "A filename such as 'yyyymmdd MyExperimentName' should be appropriate"
  check: "Click on 'Protocol->Procedure' to edit the procedure (marked '1' in the screenshot)."
  check: "Double-click on 'Start Kinetic [Run hh:mm:ss, Interval h:mm:ss]' (marked '3' in the screenshot)."
  check: "change the run time to 36 hours (marked '1' in the screenshot). A 10min interval is fine.
          This will clear all previous data"
  check: "Start the program by clicking the 'Read' button in the 'Procedure' dialog window
          (marked '2' in the screenshot), or the 'Read' icon at the top of the window
          (marked '5' in the screenshot)."
  bullet: "This should produce a pop-up asking your to wait for the bulb to heat up to 37C"
  image: "plate_reader_set_run_time"
# TODO: check the accuracy of this explanation
end
step
  description: "Next steps..."
  note: "You will now start loading your 96 well plate while the plate reader warms up"
end
