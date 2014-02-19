step
  description: "Track cells using the NIS-Elements software"
  note: "Click next to begin this protocol"
end

step
  description: "Setup your work station"
  bullet: "Turn on the computer (if not already on)"
  bullet: "Move the X-Y stage controller to the computer station"
  bullet: "Press the black button on the remote focus controller to zero your position"
end

step
  description: "Open the software"
  note: "Open and load the Nikon NIS-Elements software on the desktop."
end

step
  description: "Setup Nikon NIS-Elements UI"
  bullet: "Click on the 'Device' menu"
  bullet: "Click on the 'Manage device's' option"
  bullet: "Click on the 'Nikon Ti' option in the pop-up menu"
  bullet: "Press the 'Connect' button in the pop-up menu"
  bullet: "Close the pop-up menu"
  note: "If the device is already connected ignore this step"
end

step
  description: "Setup Nikon NIS-Elements UI"
  bullet: "Click on the 'View' menu"
  bullet: "Hover over the 'Aquisition Controls' sub menu"
  bullet: "Select both 'Cool Snaps ES Settings' and 'Ti Pad' options"
end

step
  description: "Setup Nikon NIS-Elements UI"
  bullet: "Click on the 'View' menu"
  bullet: "Hover over the 'Visualization Controls' option"
  bullet: "Select both 'XY Overview' and 'LUTs' options"
end

step
  description: "Merge the UI windows"
  note: "Click and drag the UI windows into each other to merge them as tabs"
  note: "The program is a little finiky so when dragging the pop-ups, drag them to align with the tabs of another window before dropping"
end

step
  description: "Open the ND Aquisition window"
  bullet: "Click on the 'View' menu"
  bullet: "Hover over the 'Acquisition Controls' sub menu"
  bullet: "Click on the 'ND Aquisition' option"
  note: "Don't merge this window with the others. It will make your task more difficult."
end

step
  description: "Load optical settings"
  bullet: "Click on the __ menu"
  bullet: "Click on 'Optical Settings' option"
  bullet: "Click on the 'Restore' button"
  bullet: "Navigate to 2TB drive/Rob/Settings/phasegfp.xml"
  bullet: "Open the file to apply settings"
step
  description: "Manage ND Aquisition settings"
  bullet: "Click on the 'Time' tab and ensure it is checked"
  bullet: "Ensure interval is set to 10 minutes and duration to 8 hours"
  bullet: "Click on the 'XY Position' tab and ensure it is checked"
  bullet: "Click on the Z-___ tab and ensure it is UNCHECKED"
  bullet: "Click on the Lambda tab and ensure it is checked"
  bullet: "Ensure PhaseGFP is the first setting and GFP is the second setting"
  bullet: "Ignore the lab tab"
end

step
  description: "Turn on the camera"
  note: "Press the play button, on the tool bar, under the menu bar to turn on the camera"
end

step
  description: "Adjust the lighting"
  bullet: "Select the 'TI Pad' tab"
  bullet: "Click on the red minus sign button to turn it green"
  bullet: "Slide the marker next to the green bar to adjust the light allowed by the lens"
  note: "The light should be in a grey ish contrast where you can see texture on the screen"
end

step
  description: "Adjust the LUTs"
  bullet: "Select the 'LUTs' tab"
  bullet: "Click on the small box with arrows in four directions, in the bottom right corner, to center the LUT range" 
  bullet: "Adjust the left and right cursors on the LUTs tab to encompass the peaks"
  note: "This must be played by ear, sometimes encompassing the peaks makes it too bright so add some dark regions into the range to improve contrast"
end

step
  description: "Turn on the probe"
  bullet: "Navigate to the right side of the camera viewer and locate the tool bar"
  bullet: "Click on the top most option of the tool bar to open the probe box"
  bullet: "Click and drag on the black edges of the box to create a 2x2 inch box at the center of the screen"
  bullet: "Right click on the probe and click on the 'Center to screen' option"
end

step
  description: "Adjust the XY controller"
  bullet: "Locate the X-Y stage controller next to the computer"
  bullet: "Press the X-Y speed (top-right) button and ensure that the light is fully green"
  bullet: "The top dial adjusts the Y axis and the bottom dial adjusts the X axis"
  note: "We will deal with this in the next few slides"
end

step
  description: "Start looking for cells"
  bullet: "Using the remote focus controller to adjust the focus on the screen"
  bullet: "Look for white splotches which turn black when in focus"
  bullet: "We want to look for black pill shaped rods, these are our cells"
  bullet: "When a cell is found on a focal point we will look for cells on the same XY plane"
  note: "This process takes approximately 30 minutes. If no cells are found in the region adjust the xy controller and start focusing in another region. Most cells will be found in similar focal planes"
  note: "Once any cell is found click next"
end

step
  description: "Navigating the cells"
  bullet: "Select the 'X-Y overview' tab; this will help you keep track of our selected cells"
  bullet: "Click on the 'adjust to points' button on the 'X-Y overview' window"
end

step
  description: "Selecting ideal cells"
  bullet: "We want to find elongated black rods, short rods are probably dead cells"
  bullet: "Click on the 'X-Y position' tab in the ND aquisition window"
  bullet: "When a desireable cell is found center the probe around it using the X-Y controller"
  note: "The controller may be too fast so press the 'X-Y speed' button once to make the light blink on and off. This is the controllers slowest speed used for fine tuning"
  bullet: "Click the blank check box in the 'X-Y position' tab in the ND aquisition window"
  note: "This selects the current X-Y position and stores it. It will also been seen on your X-Y overview map"
  note: "To reset the speed of the controller press the X-Y speed button twice to ensure the green light is fully on"
end

step
  description: "Set the Z-offset"
  bullet: "In the X-Y position tab, ensure include z box is checked under the points table"
  bullet: "Click the z-position of our cell in the 'X-Y position' tab"
  bullet: "Press the black button on the remote focus controller to zero the z-axis"
  bullet: "Click on the 'Offset z-position' button"
  note: "Offsetting the z-position will set the value to the current controller value"
end

step
  description: "Continue selecting cells"
  bullet: "Select 9 to 11 more ideal cells"
  bullet: "Do not offset the z-position anymore it is already done"
  note: "Cells in vertically aligned pairs are freshly divided and are great to select"
  note: "The best cells will have plenty of space around them; too many cells will make the timelapse moot."
end

step
  description: "Refocus all points"
  bullet: "Select an X-Y point in the ND Aquisition window"
  bullet: "Toggle the focus controller to refocus the cell if it unfocused"
  bullet: "Repeat for each X-Y position selected"
end

step
  description: "Run Timelapse"
  bullet: "Proceed to next protocol to run the timelapse"
end

