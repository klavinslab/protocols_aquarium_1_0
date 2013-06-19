PCR

General Purpose Short Protocol
Set-up time: ~15 min
Total Time: 40 min - 1.5 hours

1. Add the following to a carefully labeled 0.5 mL PCR tube:
 

Reagent
Amount
Where to Find it
dI H20
16 - x uL
Room temp stocks - HyClone bottles
Primers (10 uM)
2 uL each
-20 C Freezer
Template
x uL (~1 ng)
Miniprep DNA -20 Freezer or Fridge
Master Mix
20 uL
-20 C Freezer

2. Gently mix, spin down, and run in Thermocycler with the following program (default shown is Phusion Flash polymerase):

Step
Temp
Time
Notes
Initial Denature
98 C
10 sec
95 C for Taq
5 min for Colony PCR
Denature
98 C
1 sec
95 C / 15-30 sec for Taq
Annealing
X C
5 sec
X = Tm+3 for Flash >20 nt primer
X = Tm Flash <20 nt primer
X = Tm-2 for Taq / 30 sec for Taq
Extension
72 C
Y sec
Y = 10-15sec/kb sec for Flash
Y = 1min/kb + 10 sec for Taq
Fin Extension
72 C
7 min


Fin Hold
4 C
Inf








Reagents/Supplies:


Molecular Grade Water
Fwd and Rev Primers (10 uM)
PCR Master Mix
Thermocycler
Template DNA or Colony




Notes/Tips:
Annealing Temperatures:
To calculate Tm for your primers, we've found the Finnzymes calculator to be pretty reliable.  It's good to note that each polymerase recommends a different annealing temperature.  Taq recommends starting at Tm-5, but we typically use Tm-2 and get good results.  Phusion recommends Tm+3 for primers >20 nt in the binding region, and Tm for primers <20 nt in length.  If you are using a different polymerase, read in it's documentation to find the recomended annealing temperature.  If you are still having trouble getting clean bands, try gradient PCR.

Reaction Volume:
The reaction volume can be modified by linearly scaling all reagents by 0.4 to get a 20 uL reaction, though the yield concentration will be lower.  This is best to use when high yields are not necessary, i.e. screening colonies, Gibson Cloning, etc., but a 50 uL reaction is best for obtaing higher concentrations of DNA for standard and Gateway cloning.

Gradient PCR:
For some primers, it is difficult to find the best annealing temperature, and for this we typically use gradient PCR to debug it.  To do so, follow the standard protocol listed above to set up 6 identical reactions (20 uL volume should be sufficient).  Set up the thermocycler to vary the temperature linearly across the plate for the annealing step only.  The temperature varies as shown:
o  o  o  o  o  o
-      mid      +
You can set the 'mid' temperature and the spread across the whole plate.  For example, setting the temperature to 65 with a variation of 10 will use these annealing temperatures from left to right across the plate: 60, 62, 64, 66, 68, 70.  As a first try, choose the recommended annealing temp as the 'mid' temperature, and use a variation of 10.  After running the PCR results in a gel, choose the annealing temperature that produced the strongest and cleanest band for future reactions.

Hot-Start PCR:
Rob, can you add info here???


Purpose/Description:
Paste from Biocircuits course.

Background Information / Related Papers / Links:
More information on Qiagen's Taq Master Mix
More information on Finnzymes Phusion Polymerase Master Mix


Contacts/Authors:
Brandi House, Rob Egbert


