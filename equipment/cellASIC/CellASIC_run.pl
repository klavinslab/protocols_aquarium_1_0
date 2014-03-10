require "includes/devices/microscope_prep.pl"
information "Using CellASIC and fluorscence microscopy to get time-series data on cells"

step
  description: "Seal the microfluidic plate to the F84 manifold"
  check: "Place the microfluidic plate on a flat surface."
  check: "Align and set the manifold over the wells of the plate."
  check: "Push down on the manifold with slight force and turn on the vacuum switch on the ONIX box while keep pushing down to manifold to 
ensure uniform contact during sealing."
  check: "When a proper seal is formed, the green sealed light will be lit."
  note: "If not successful, repeat the above steps until the green light lit."
  note: "Make sure a proper seal is formed before proceeding. Leave the vacuum on during the course of the experiment."
end

step
  description: "Change to rectangle plate holder on the microscope"
  note: "Only perform this step if it is not rectangle plate holder currently placed on the microscope."
end

prep_lens()

step
  descriotion: "Place the assembled microfluidic plate with manifold on the rectangle plate holder"
end
