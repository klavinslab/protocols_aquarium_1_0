#Author: Chris Takahashi
needs "aqualib/lib/standard"
require 'json'
$DEF_FILE = './repos/protocols/recombineering/defaults.json'
$defaults = JSON.parse(File.read($DEF_FILE))

class Protocol
  include Standard
  def debug
    true
  end
  def arguments
    {params: $defaults}
  end
  def main

    p = input[:params]

    ##
    #foreach cult in unique(st)
    #  ii = 0
    #  count = array_count(st,cult)
    #  nflsk = ceil(ii/4.0)
    #  ii = 0
    #  while ii<nflsk
    #    logCult= append(logCult,cult)
    #    ii = ii+1
    #  end
    #  
    #end
    logCult = []
    st = p[:strains]
    st.uniq.each do |cult|
      ii = 0
      nflsk = (st.count(cult)/4.0).ceil
      logCult.concat [cult]*nflsk
    end

    #
    #params[:logCultures] = logCult
    #strainIDs = params[:logCultures] #wtf was this?!
    p[:logCultures] = logCult
    #
    #information "Dilute cells and bring them to log phase"
    #
    #nflasks = length(strainIDs)
    #take
    #	strains = item unique(strainIDs)
    #	flasks = nflasks "250 mL Baffled Flask"
    #end
    nflasks = logCult.length
    strains = []
    logCult.uniq.each do |an_id|
      strains.concat  find(:item, id: an_id)
    end
    take strains, interactive: true

    #TODO: DIE if find doesn't find the right thing!

    flasks = choose_object("250 mL Baffled Flask", take:false) {
      title "Take #{nflasks} flask(s)"
    }
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

    #produce a flask of cells for each item in logCult
    innoculated_flasks = []
    strains.each do |str|
      nduplicates = logCult.count(str.id)
      for ii in 1..nduplicates do 
        an_innoculated_flask = produce new_sample str.sample.name, 
          of: str.sample.sample_type.name, as: "Overnight suspension"
        an_innoculated_flask.location = "SI4"
        an_innoculated_flask.datum = {from:str.id}
        an_innoculated_flask.save
        innoculated_flasks.push an_innoculated_flask
      end
    end

    show {
      title "Label each flask"
      innoculated_flasks.each do |flsk|
        check "label a flask '#{flsk.id}'"
      end
    }

    show {
      title "add 25ml of LB+thymine to each flask"
      note "go to the media bay and using the steriological pipette, transfer 
            25ml LB+thymine into each flask"
      warning "This step has changed recently!  make sure to use LB+thymine."
    }
    #
    #step
    #  description: "Dilute overnights into flasks"
    #  foreach flask in produced_flasks 
    #    check: "Transfer 350  &micro;L of overnight " + to_string(flask[:data][:from]) + " to flask " + to_string(flask[:id])
    #  end
    #  note: "By the end of this step each each flask should have gotten 350 &micro;l of overnight culture.  If not make a note here."
    #end
    show {
      title "Dilute overnights into flasks"
      innoculated_flasks.each do |flsk|
        check "Transfer 350 &micro;L of overnight #{flsk.datum[:from]} 
                to flask #{flsk.id}"
      end
      note "By the end of this step each flask should have gotten 350 
            &micro;l of overnight culture.  If not make a note here."
    }

    show {
      title "Incubate flasks"
      innoculated_flasks.each do |flsk|
        bullet "Place flask #{flsk.id} into SI4"
      end
      note "Place all flasks above into the 30C shaker incubator (SI4)"
    }

    show { 
      title  "Prepare a heat bath"
      bullet "Locate and plug in the hot water bath."
      bullet "Press the button on the left labled 'I/O' to turn on the 
              controller."
      bullet "Set the middle temperature to 42 C"
      note   "Press the refresh button until a flashing tempurature appears and 
              the leftmost thermometer is illumminated."
      note   "Use the up and down arrows to set the tempurature of the heat bath 
              to 42 C."
      image  "heat_bath"
    }
    
    show {
      title "Prepare the centrifuges"
      note "Find both the large centrifuge C3 at B15.410 and the smaller 
            centrifuge C2 at B5.335 and adjust the temperature setings to 4C.  
            Make sure the lids are closed when you're done as they won't 
            refrigerate when open."
    }
    
    p[:log_cells] = innoculated_flasks.map{|e| e.id}
    foo = innoculated_flasks.map{|e| e.id}
    
    show {
      title "debug"
      note ":log_cells #{foo}"
    }
    
    return {params: p}
    
    
    release strains
    
  end
end
