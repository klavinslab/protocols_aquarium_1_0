Notes/Directions 

    - All irrelevent sections/headings are to be deleted. 
        ex. For a single day protocol, delete all references to "Day" 
    - All items in square brackets are place holders to be replaced by some other value
        ex. "[Protocol Name]" could be replaced by "Gel Elecrophoresis"
    - The description is a one or two sentance summary of what the protocol accomplishes



Gene synthesis from oligos
--------------
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
Description: Sometimes you see a gene in a paper and you just want it! Or you want 100 variants of it. Maybe the authors never respond to your email. Maybe they don't want to send it. Maybe there's a restrictive MTA associated with it. Maybe a gene won't amplify from cDNA. Maybe IDT can't build it from gBlocks. Why not build it yourself?

- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
####Total duration: 5 days (including design)
####Total worktime: 3 hours

    - Day 1: 1 hour
    - Day 5: 2 hours
    
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

####Required equipment and materials####

Day 1

    * DNAworks codon optimization tool
        + Duration needed: 5-30 minutes
        + Location: http://helixweb.nih.gov/cgi-bin/dnaworks/dnaworks.pl
    * DNA Design Suite
        + Duration needed: 5 minutes
        + Location: http://dnadesign.herokuapp.com/oligo_assembly
  
Day 5

    * Thermal cycler
        + Duration needed: 2 hours
        + Location: Bay 2
    * Gel box
        + Duration needed: 1 hour
        + Location: [address]
        
---------

        
    * [Item 1]
        + Quantity: [x ml/mg/items]
        + Location: [address]
    * [Item 2]
        + Quantity: [x ml/mg/items]
        + Location: [address]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

##Protocol##
_Note: this protocol is optimized for 120-160 nt OligoCo oligos and works best for target fragments up to 1.4 kb._

Day 1

1. Codon optimize any protein coding sequences using DNAworks.
2. Generate target sequence map taking care to consider downstream assmebly using Gibson or other assembly methods.
3. If larger than 1.5 kb, break with Gibson overhangs of 40-50 bp.
4. Design overlapping oligos for each sequence map using Nick Bolten's DNA Design oligo assembly tool.
5. [Step 3]

Day 2

1. Add (600-10*n) uL TE buffer, where n is the number of oligos (generally 8-12), to an empty 1.5 mL Eppendorf tube.
2. Transfer 10 uL of each assembly oligo to from undiluted source well.

_Note: this makes a roughly 1 uM oligo pool._

3. Transfer 10 uL of the oligo pool to a new 1.5 mL Eppendorf tube containing 190 uL 
2. Run gel, verify successful assembly, and extract full-size band.
3. Proceed to Gibson reaction. If the final product is broken up into multiple fragments, consider subcloning and sequencing each fragment separately before combining. If sequencing 8 clones, 1.5 kb is near the 90% confidence interval limit for identifying an error-free clone given an oligo error rate of 1/1000.

- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
    
    
####Additional Information and Settings####

    [Parameter/variable/clarification/option 1]:
        [Option 1]:
        [Option 2]:
    [Parameter/variable/clarification/option 2]:
        [Option 1]:
        [Option 2]:


####Common Issues####

    [Issue 1]:
        - [Solution 1]:
        - [Solution 2]:
    [Issue 2]:
        - [Solution 1]:
        - [Solution 2]:
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
       
For questions, contact ___ at ___@gmail.com    
