Primer Design

Introduction:

There are several different approaches to primer design, but they focus around the same basic idea: designing an oligonucleotide with ‘good’ binding properties. A basic primer binds to a DNA or RNA template and enables extension along that template via a DNA polymerase (usually or PCR). There are many good resources for understanding PCR and primer extension in general, see here and here.

This protocol describes basic primer design - the design of oligonucleotides that anneal exactly to a desired template and do not make any modifications to that template. Often, a more complex primer needs to be ordered in order to introduce or remove sequences from a plasmid or PCR product. Below is a short list of guides to making this primers.

Basic primer design for PCR
Gibson assembly primers

Basic primer design for PCR

Introduction:

PCR is used to obtain a large amount of a specific section of DNA (TODO: put figures here) and the protocol requires only that you have designed correct primers (oligonucleotides), have the correct DNA template from which a specific section of DNA will be amplified, and an enzyme mixture that does the DNA extension.

Protocol:

TODO: See this example protocol for designing primers to amplify EGFP from a template plasmid.

Step 1. Select a DNA template with the part or parts that you want to amplify and open it in your DNA viewing program of choice (ApE or j5 are good free options).
Step 2. Copy the DNA that you want to amplify into a new window / session of your DNA editor.
Step 3. Select approximately the first 40 base pairs of the sequence.
Step 4. Paste that sequence into the finnzymes calculator (requires java). Nick has a script version of this calculator in the R programming language if anyone would prefer an offline option. If you are a member of the SOSlab, our primer database interface has the calculator as well.
Step 5. Check the Tm listed by the calculator ( it will be in bright red). Start removing bases from the 3’ end (the right side) until you get close to or above the desired Tm. People have different preferences for the Tm, but the most important thing is that it is consistent - Nick recommends 70-72°C. Ideally a primer pair should have close to identical Tms.
Step 6. Copy and paste the remaining bases into a new document - you have designed your ‘forward’ primer. Double check that it was correctly designed by searching for its sequence in your DNA map (DNA design program). You can also double check your primers for undesired binding properties in NUPACK, but this is generally only necessary if your PCR primers are not working or if you expect them to be able to anneal to each other.
Step 7. Reverse complement the entire sequence that you want to PCR from. Repeat steps 3-6 to generate your ‘reverse’ primer.


Gibson Assembly Primers

Primers for Gibson assembly often require the addition of extra sequence at the 5’ end of a normal PCR primer. The purpose of this is to introduce new matching sequences onto the ends of the separate PCR products so that they can be stitched together in a Gibson reaction. In the end, a typical Gibson primer looks like this: 5’ Overlapping_sequenceannealing_sequence 3’

TODO: See this example protocol for designing primers to amplify EGFP from a template plasmid and insert it into a vector

Step 1: Using your favorite plasmid/DNA editor, design the construct that you want to build - copy, paste, and delete sequences. Keep track of the changes made and where the junctions between parts are located.
Step 2: Design PCR primers that anneal to each element that needs to be amplified - the pieces you want to put together.
Step 3: In the mocked-up plasmid, find one of the junctions between parts and find the primer that anneals there, e.g.:
	5’ upstream_sequenceprimer_annealing_sequence 3’ 
Where the red upstream_sequence is the part of the mockup DNA immediately upstream of the primer.
Step 4: Take 40 bases of that upstream sequence and put it into the finnzymes calculator. This time, trim the sequence from the 5’ end (the left) until you get a Tm of about 65°C (or a bit higher). There are alternative strategies to designing this sequence that also work: make it 15-25 bases or just use 60-(the annealing primer length) so long as it’s greater than 15 bases (a 60-nucleotide oligonucleotide is the longest you can order in the cheapest price tier).
Step 5: Combine the new sequence (AKA the Gibson homology or Gibson overlap) with your primer: 5’ Gibson_overlapprimer_annealing_sequence 3’ 
	This is your new Gibson assembly primer - one long oligonucleotide that can anneal to your desired template and adds the necessary homology (matching sequence) to the end of the PCR product.
Step 6: Check your primer by searching for the entire sequence (overlap and annealing in one string) in the mocked-up plasmid.
Step 7: Repeat steps 3-6 until you have all of the overlaps covered. Keep in mind that you will need to reverse complement the Gibson overlap as well for a ‘reverse’ primer. Another important note: the total amount of overlap should be 15-25 base pairs or have a Tm of 65°C on the finnzymes calculator. That overlap can be placed on only one PCR product at a given junction, or place on bother (TODO: pictures here would be helpful). In general, try to minimize the number of primers that need overlap - that way you can reuse the same annealing-only primer in several different Gibson reactions (e.g. a primer that binds to a commonly-used plasmid backbone).