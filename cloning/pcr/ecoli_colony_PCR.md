_E. coli_ colony PCR
--------------
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
Description: This protocol describes how to amplify DNA fragments using live cell cultures as a source for the DNA template. Colony PCR is primarily useful for validating genomic DNA manipulations (often to be sequenced) or plasmid cloning outcomes.

- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
####Total duration: 14 hours####
####Total worktime: 1 hour

    - Day 1: 5 minutes
    - Day 2: 45 minutes
    
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

####Required equipment and materials####

Day 1

    * Shaker or incubator
        + Duration needed: 12 hours
        + Location: Wall
  
------

    * 14 ml glass culture tube
        + Quantity: 1
        + Location: B1.450
    * Growth media (likely LB)
    	+ Quantity: 2 ml
    	+ Location: B1.465
    OR
    * LB agar plate
        + Quantity: 1
        + Location: R1 (B1.200)

Day 2

    * Heat block or PCR machine
        + Duration needed: 10 minutes
    * Mini-centrifuge
        + Duration needed: < 1 minute
	* Ice block
		+ Duration needed: 15 minutes
    * PCR machine
        + Duration needed: 2-3 hours
        
---------

        
    * 0.2 ml PCR tube
        + Quantity: 1
        + Location: B2 bay
    * 2x Taq PCR mastermix
        + Quantity: 5 ul
        + Location: -20 C freezer
    * Molecular grade water
        + Quantity: 3 ul
        + Location: B2 bay
    * Target primers
        + Quantity: 0.5 ul each (@ 10 uM)
        + Location: -20 freezer
    
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

##Protocol##

Day 1

1. Inoculate target culture on LB agar plate or in LB liquid media. For agar plates, generate colonies via transformation plating or streaking a plate from a glycerol stock culture. For liquid cultures, transfer colony or glycerol stock stab to  
2. Incubate for 12-24 hours until you observe individual colonies or saturated liquid culture.

Day 2

1. Transfer a single colony (agar plate) or 1 ul (liquid media) to a 0.2 ml PCR tube filled with 40 ul phosphate buffered saline (PBS). 

_Note: use a 0.6 or 1.5 ml tube if you plan to use the heat block in step 3_.

2. If using a colony you plan to use after this protocol, mix and split the culture into a second tube.
3. Boil the culture for 10 minutes at 95 C using a heat block or a thermal cycler to lyse the cells.
4. While the culture is , prepare the PCR reaction by sequentially adding 5 ul Taq master mix, 3 ul molecular grade water, and 0.5 ul of each PCR primer to a 0.2 ml PCR tube.
4. Centrifuge the cells for 30 seconds to settle the detritus pellet.
5. Carefully transfer 1 ul to the PCR solution, taking care not to disturb the detritus pellet.
6. Program a thermal cycler to with the following settings, repeating steps b-d for 35 cycles:
	A. 95 C for 5 minutes
	B. 95 C for 1 minute
	C. 55-65 C for 30 seconds*
	D. 72 C for 1-2 minutes**
	E. 72 C for 10 minutes
	F. 7 C infinity
	
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -     
    
####Additional Information and Settings####

    *Taq Tm:
        The annealing temperature should be run 5 C lower than the lower Tm of the two primers from the Finnzyme / SOSlab database Tm calculator.
    **Extension time:
		Assume an extension time of 1 kb per minute with a minimum of 30 seconds.        

- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
       
For questions, contact Rob Egbert at robegbert@gmail.com    













Other protocol:

Colony PCR with Green Taq (See General PCR Protocol and PCR_GoTaq)

Master mix (7ul): 1ul 10uM forward primer 1ul 10uM reverse Primer 5ul 2x Green taq (GoTaq)

Cell water (3ul): Pick one colony from the plate and mix with 10ul of sterile ddH2O or PBS to make 10ul of cell solution If screening for successful clones, the cell solution should be retained Sterile glycerol can be added to 50% final concentration, and cell solution can be frozen at -80oC for use at a later date

Reaction Mixture: Master mix (7ul) + Cell solution (3ul) = 10ul total per tube Use program "Colony" & change the extension time (1 min per kb)

PCR Program: “Colony PCR”

1 Cycle 94o 3 minutes 25 Cycles 94o 30 seconds 55-60o 30 seconds 72o Amplicon specific (~ 1 minute per kb) 1 Cycle 72o 7 minutes 4˚ Forever






