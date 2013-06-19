Auxin Gene Cloning


It takes roughly two weeks and many steps to prepare a new auxin gene yeast strain from scratch.  We first amplify our gene of interest from Arabidopsis thaliana cDNA, adding partial attB1 and attB2 sites.  We then add the full attB1 and attB2 sites using an adapter PCR.  Finally, we use Gateway cloning to create a library pDONR plasmid and any desired destination plasmid, and transform yeast.
	
Auxin Primer Design

1. Find your gene at TAIR and scroll down to the "Nucleotide Sequence" section.  Select "Full CDS" and use this do design your primers.  If "Full CDS" is not available, you can either look for it on a different site (e.g. NCBI) or determine the most likely CDS in the "cDNA" of "Full Genomic" options using software like ApE.

2. Design primers to clone the gene from cDNA.  Info can be found at Primer Design. Therefore, we need a forward primer beginning with the stop codon (ATG) and a reverse primer beginning at the stop codon (when reverse-complimented, usually TTA).  We shoot for a primer Tm of around 72°C when using the Finnzymes calculator.  Remove the stop codon if your gene will have a C-terminal fusion.  Add an extra stop codon if you are worried about read-through.

3. We use the Adapter method to add attB sites to our genes.  This means we first add on partial attB1 and attB2 sites respectively to the forward and reverse primers in the PCR from cDNA, then do a second PCR with standard primers to add the rest of the attB sites. Add the following hanging regions to the correct primer.  They are in the right direction for copying and pasting directly onto the 5' end of your primers.


Primer
Hanging Region
Forward
AAAAAGCAGGCTTCAAA
Reverse
AGAAAGCTGGGTG


Yellow	= Partial attB site
Light Blue	= Insert to keep N-terminal fusions in-frame
Dark Blue	= S. cerevisiae Kozak Sequence
Red		= Spacer
Sometimes people have used primers where the spacer (in red) is actually a T.  Don’t panic if you see this in a construct.

4. Double check your primers by creating your expected plasmid in ApE.  This file will also come in useful when you need to screen transformants.  Use an existing pDONR-insert ApE file to make this easier and copy + paste the new insert into place.  Your primers should find a perfect match in the plasmid.  Note: Sometimes the attB2 spacer (the ‘Red’ base) has been a T.  Make sure you construct an ApE file that uses the attB2 sequence that you expect.

5. Order the primers!  When they arrive, resuspend them in TE pH 8.0 to a concentration of 100µM (add 10µL TE for every picomole of primer).  Then 
make 10µM water-diluted stocks of 50µL.  Do not use TE for 10µM stocks, it will inhibit the PCR.

cDNA PCR
								
Set-up time: ~10 min
Total Time: 2 - 4 hours


Reagent
Amount
Where to Find it
Molecular Grade H₂O
3 µL
Benchtop
10µM forward gene primer
0.5µL
-20°C Freezer
10µM reverse gene primer
0.5µL
-20°C Freezer
Arabidopsis cDNA (after 1:5 dilution with water)
1 µL
-20°C Freezer
Phusion Master Mix
5µL
-20°C Freezer


1. Add the reagents above, from top to bottom, to a clean PCR tube.  If we have no cDNA, make more.  Make sure to keep the cDNA on ice.

2. Amplify using the Phusion PCR protocol.

3. Run 4µL on a gel to verify amplification and length.

4. If you only have one band, or primarily one band, and it's of the right length, stab the band of the right location, ‘mix’ the tip in 40µL of molecular grade water, and proceed to the Adapter PCR using 20µL of this mixture as water+template.



Adapter PCR


Reagent
Amount
Where to Find it
Molecular Grade H₂O
19µL
Benchtop
10µM forward Adapter primer
2.5µL
-20°C Freezer prKL52
10µM reverse Adapter primer
2.5µL
-20°C Freezer prKL53
PCR-purified cDNA PCR product, 1ng/µL
1µL
-20°C Freezer
Phusion Master Mix
25µL
-20°C Freezer


1. Dilute 1µL of the purified cDNA PCR to ~1ng/µL in molecular grade water.  e.g., if our PCR product is 50ng/µL, we add 1µL of PCR product to 50µL of molecular grade water.  Do not dilute in TE, it will inhibit the PCR.

2. Add the reagents above, from top to bottom, to a clean PCR tube.

3. Amplify using the two-step Phusion Adapter PCR protocol below.  There is a program titled "Adapter PCR" in our thermocyclers which can be modified to save time.


Step             
Temp
Time  
Notes                                    
Init Denat
98°C
30 sec


5 cycles of:






Denat
98°C
10 sec


Annealing
45°C
20 sec
Anneals to partial attB sites
Extension
72°C
X sec
X = 20sec/kb + 10 sec
20-25 cycles of:






Denat
98°C
10 sec


Annealing
72°C
20 sec
Anneals to new, full attB sites
Extension
72°C
X sec
X = 20sec/kb + 10 sec
Fin Extention
72°C
5 min


Fin Hold
4°C
Inf




4. Run 5µL on a gel to verify amplification and length.

5. If you only have one band, or primarily one band, and it's of the right length, PCR purify the cDNA PCR and proceed to the BP reaction.  If you have significant primer dimers (a strong fuzzy band well below the 500bp mark), you may want to run a new gel with a lot of PCR product and gel purify the band or redo the PCR with more stringent conditions like a higher initial Tm (45°C -> 50°C).


BP Reaction

1. Use your PCR-purified Adapter PCR product in a BP Reaction.

2. If you have colonies the next day (~>16 hours later), pick colonies and start overnight cultures in TB + Kan media.

3. Miniprep (and save) the overnight cultures the next day and screen with a restriction digest or M13F+M13R PCR.  Glycerol stock an overnight that had the right band lengths and sequence its miniprep.  IAAs can be fully sequenced with M13F and M13R.  AFBs, ARFs and other large genes typically need custom sequencing primers to cover the middle regions, so keep this in mind so you can order the primers beforehand.

4. Do Sequence alignments using seaview, take notes of any discrepancies.  Seaview easily does multiple alignments and uses the more accurate MUSCLE tool for comparisons. 
A. Open seaview, add your 'expected' sequence (Edit > Load 			sequence).  I usually name this 'M13F-M13R Expected', as M13 			sequences are the usual boundaries.

B. If you are aligning more than one sequencing result, duplicate the 		expected sequence several times to force better positioning (Edit > 		Duplicate sequence).

C. Add your sequencing results (Edit > Load Sequence), then click 		Align > Align All.  Then click 'OK'.

D. Your sequences are now aligned.  We want a consensus sequence 		for spotting mismatches: go to Props > Consensus options > Edit 		thresholds and set to 100%

E. Select all sequences using 'Ctrl + a' and generate 'Consensus100' 		by clicking Edit > Consensus sequence.

F. Visualize errors by looking for 
i. gaps in the non consensus sequences and 
ii. non-ATGC characters in the consensus sequence. This is easier if you set seaview's background to a light color.

Important alignments should also be saved/shared/uploaded to the database as clustal .aln files.

5. If the sequencing results match the expected sequence, the pDONR construct has been verified and our pDONR database can be updated.  You can also proceed to an LR reaction to make yeast destination constructs.


LR Reaction
(tl;dr: same as the BP reaction but with LR Clonase and TB+Amp media)

1. Use the desired gene-pDONR construct and destination plasmid in an LR Reaction.

2. If you have colonies the next day (~>16 hours later), pick colonies and start overnight cultures in TB + Amp media.

3. Miniprep (and save) the overnight cultures the next day and screen with a restriction digest - preferably choose enzymes that produce bands of different sizes and at least one cut site in your auxin gene.  Glycerol stock an overnight that had the right band lengths and sequence its miniprep.  IAAs can usually be fully sequenced with M13F, GPDPro Fwd or *FP Fwd, and M13R.  Larger genes will require newly-designed gene-specific sequencing primers.

4. Do Sequence alignments using seaview.  The method is described above in the BP reaction section.

5. If the alignments match up, the destination construct has been verified and our destination construct database can be updated.  You can also proceed to an LR reaction to make destination constructs.

Yeast Transformation

1. Use the desired destination plasmid in a yeast transformation.

Troubleshooting

PCR: If you have trouble getting any amplification from cDNA, double check your primers and try using different Arabidopsis cDNA.  We have two kinds: seedling and flower.  Lowering the annealing temp or adding one or two cycles may also help.


Contacts/Authors:
Nick Bolten
