needs "aqualib/lib/standard"
needs "aqualib/lib/cloning"

class Protocol

  include Standard
  include Cloning

  def arguments
  	{
      io_hash: {},
  		plate_ids: [13578,13579],
  		num_colonies: [3,3],
  		debug_mode: "No",
      group: "cloning"
  	}
  end

  def main
    io_hash = input[:io_hash]
    io_hash = input if (!input[:io_hash] || input[:io_hash].empty?)
    # include keys if they don't exist
    io_hash = { plate_ids: [], num_colonies: [] }.merge(io_hash) 
  	io_hash[:debug_mode] = input[:debug_mode] || "No"
    if io_hash[:debug_mode].downcase == "yes"
      def debug
        true
      end
    end

    io_hash[:comb_1] = "10 thin"
    io_hash[:comb_2] = "10 thin"
    io_hash[:volume] = 10 # volume for PCR


    tasks = find(:task,{ task_prototype: { name: "E coli Strain QC" } })
    waiting_ids = (tasks.select { |t| t.status == "waiting" }).collect {|t| t.id}
    #What is this doing?  It looks like it only runs tasks submitted by "your" 
    #group.  why?
    io_hash[:task_ids] = task_group_filter(waiting_ids, io_hash[:group])
    io_hash[:task_ids].each do |tid|
      task = find(:task, id: tid)[0]
      io_hash[:plate_ids].concat task.simple_spec[:plate_ids]
      io_hash[:num_colonies].concat task.simple_spec[:num_colonies]
    end


    if io_hash[:plate_ids].length != io_hash[:num_colonies].length do
      raise "Incorrect inputs, plate_ids size does not match num_colonies size. 
             They need to be one to one correspondence." 
    end

  	show {
  		title "Protocol information"
  		note "This protocol picks colonies and makes overnights for lysates"
      warn "This protocol does not use ANY antibiotics and contamination can 
            cause MAJOR setbacks.  Wear gloves.  Ethanol your gloves 
            periodically.  Never touch the inside of lids or set them on the 
            bench.  When picking colonies, never touch the tip of the pipette
            to anything but the colony and destination media."
  	}


    n_overnights = io_hash[:num_colonies].reduce(:+)
    show {
      title "Prep #{n_overnights} tubes of media"
      note "Do the following things in the media bay:"
      bullet "Gather #{n_overnights} 15 ml falcon tubes"
      bullet "In each tube put 2.5 to 3.5 ml of LB"
      bullet "Bring the tubes of media back to your bench"
    }

  	ecoli_items = io_hash[:plate_ids].collect {|yid| find(:item, id: yid )[0]}
  	take ecoli_items, interactive: true

  	yeast_samples = []
  	yeast_colonies = []
  	ecoli_items.each_with_index do |y,idx|
      n_col = io_hash[:num_colonies][idx]}
      show {
        title "Choose colonies from plate #{y.id}"
        note "Put the plate with ID #{y.id} infront of you"
        note "If colonies on the plate are not already marked c1, c2 ...
              circle #{n_col} colonies and number them c1, c2, ..."
        note "If colonies are morphologically heterogenious, choose a variety."
      }
  		(1..n_col).each do |x|
        #todo: create a new sample, and then create an overnight suspension of that
        step {
          title "Scrape colony c#{x} into into a tube of media"
          note "Read all bullets first (until your comfortable with the process)"
          bullet "with your dominant hand grab a pipett tip 
                  (10 &micro;L or 100 &micro;L)."
          bullet "Place the plate agar side up on the bench."
          bullet "With your non-dominant hand pick up the agar side of the plate
                  leaving the lid on the bench"
          bullet "Scrape colony c#{x} off the plate without disturbing any 
                neighboring colonies.  If the colony is big don't worry about 
                getting the whole thing.  a few cells out of billions is enough."
          bullet "Place the agar side of the plate back in its lid."
          bullet "while still holding the pipette tip, 
                  grab a tube of LB, uncap it, and carefully tilt it until you 
                  can dip the pipette tip into the media.  Recap the tube and 
                  discard the tip."
          check "label the tube with id: #{tube_id}"
        }

  		end
  	end


  	

    return { io_hash: io_hash }
  end

end