#Author: Chris Takahashi
require 'json'
class Protocol
  def debug
    true
  end
  def main
    def_file = './repos/protocols/recombineering/defaults.json'
    defaults = JSON.parse(File.read(def_file))

    def argument
      {params: defaults}
    end
    p = input[:params]

    show {
      title "test"
      note "#{p}"
    }
#
#function array_count(arry,match) #returns number of instances of match in arry
#  ii = 0
#  foreach a in arry
#    if a == match
#      ii = ii+1
#    end
#  end
#  return ii
#end
#
#logCult = []
#st = params[:strains]
#foreach cult in unique(st)
#  ii = 0
#  count = array_count(st,cult)
#  while ii< count
#    ii = ii + 1
#  end
#  nflsk = ceil(ii/4.0)
#  ii = 0
#  while ii<nflsk
#    logCult= append(logCult,cult)
#    ii = ii+1
#  end
#  
#end
#
#params[:logCultures] = logCult
#strainIDs = params[:logCultures]
#
#information "Dilute cells and bring them to log phase"
#
#nflasks = length(strainIDs)
#take
#	strains = item unique(strainIDs)
#	flasks = nflasks "250 mL Baffled Flask"
#end
#
#ind = 0
#log_cell_flasks = []
#produced_flasks = []
#log_ids = []
#fids = []
#foreach strain in strains
#  sid = strain[:id]
#  ncopy = array_count(strainIDs,sid)
#  ii=0
#  while ii<ncopy
#    produce silently
#      output = 1 "Overnight suspension" from strain 
#      release [flasks[ind]]
#      location: "SI4"
#      data
#        from: sid
#      end
#    end
#    ind = ind+1
#    log_cell_flasks = append(log_cell_flasks, output[:id])
#    produced_flasks = append(produced_flasks, output)
#
#    fid = output[:id]
#    fids = append(fids,fid)
#    ii = ii+1
#  end
#end
#
#step
#  description: "Label flasks"
#  foreach f in fids
#    check: "label a flask '%{f}' "
#  end
#end
#
#step
#  description: "add 25ml of LB+thymine to each flask"
#  note: "go to the media bay and using the steriological pipette, transfer 25ml LB+thymine into each flask"
#  warning: "This step has changed recently!  make sure to use LB+thymine."
#end
#
#step
#  description: "Dilute overnights into flasks"
#  foreach flask in produced_flasks 
#    check: "Transfer 350  &micro;L of overnight " + to_string(flask[:data][:from]) + " to flask " + to_string(flask[:id])
#  end
#  note: "By the end of this step each each flask should have gotten 350 &micro;l of overnight culture.  If not make a note here."
#end
#
#step
#  description: "Incubate flasks"
#  foreach flask in produced_flasks
#    bullet: "Place falsk " + to_string(flask[:id]) + " into SI4"
#  end
#  note: "Place all flasks above into the 30C shaker incubator (SI4)"
#end
#
#step
#  description: "Prepare a heat bath"
#  bullet: "Locate and plug in the hot water bath."
#  bullet: "Press the button on the left labled 'I/O' to turn on the controller."
#  bullet: "Set the middle temperature to 42 C"
#  note: "Press the refresh button until a flashing tempurature appears and the leftmost thermometer is illumminated."
#  note: "Use the up and down arrows to set the tempurature of the heat bath to 42 C."
#  image: "heat_bath"
#end
#
#step
#  description: "Prepare the centrifuges"
#  note: "Find both the large centrifuge C3 at B15.410 and the smaller centrifuge C2 at B5.335 and adjust the temperature setings to 4C.  Make sure the lids are closed when you're done as they won't refrigerate when open."
#end
#
#params[:log_cells] = log_cell_flasks
#
#log
#  return: {params: params}
#end
#
#
#release strains
#
  end
end
