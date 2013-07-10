Yeast Colony PCR
--------------
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
Description: Yeast colony PCR to verify successful intergration.
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
####Total duration: 4 hours####

####Total worktime: 10 minitues####
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
####Required equipment and materials####

    * Thermocycler
        + Duration needed: 3.5 hrs
        + Location: [address]
    * Phusion Master Mix
        + Quantity: 1 tube
        + Location: [address]
    * MGH2O
        + Quantity: 1 tube
        + Location: [address]
    * Yeast Lysate (prepared in previous step)
        + Quantity: NA
        + Location: [address]
        
    * Primers (depends on which locus the integration is on)
        + Quantity: NA
        + Location: [address]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
##Protocol##

1. Make 1/10X diluted lysates.
2. Set up standard Phusion PCR mix as below.
A typical QC PCR is a 10uL Phusion reaction:
	3.5uL MGH2O
	0.5uL 1/10X lysate
	0.5uL primer 1
	0.5uL primer 2
	5uL Phusion Master Mix
3. Set up thermal cycler:
	3 min 98C
	35 cycles of:
		10s 98C
		20s primer Tm - 2 or -4C (e.g. for 72C primers, use 68C or 70C).3.5-4 minutes 72C (extension. Long time = more chance of getting product)
	72C 5 min
	Hold at 4C

- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
####Additional Information and Settings####

Use an annealing temperature 2-4C below the primer TM

####Common Issues####

None

For questions, contact Nick Bolten at bolten@u.washington.edu


PCR Design:

Yeast colony PCR is for seeing whether a genomic modification (insertion, deletion, etc) has been successful.

Verifying plasmid or PCR integration:
pGP and pMOD vectors integrate once, others integrate multiple times.

Once a plasmid type is known to integrate only once, it is only necessary to do the Insert-Locus PCR. Vector types known to integrate only once:
pGP4
pGP5
pGP6
pGP8
pMODKan

Standard PCRs used to verify plasmid integration events:
ID
Name
Primer 1
Primer 2
Purpose
1
Insert-Locus


‘Forward’ insert primer (e.g. IAA17 cloning primer)
‘Reverse’ genomic primer
Verifies specific insert at specific locus.
2
Plasmid-Locus


prKL606 
(CYC1 forward)
‘Reverse’ genomic primer
Verifies that at least one plasmid is integrated at the correct locus.
3
Multiple Integration
prKL344 
(pGEX3 forward)
prKL135
(reverse pGPD)
If multiple tandem insertions, will amplify small product.
4
Single Integration
‘Forward’ genomic 
primer
‘Reverse’ genomic primer
Verifies single insertion event.

Insert-Locus and Plasmid-Locus:

Single Integration:
It is often easier to do the less specific Plasmid-Locus PCR, but then you lose the certainty of knowing for sure that a given insert is at the correct locus (e.g. it is all to common to accidentally switch up tubes and integrate the wrong thing).




Genomic primers (only use both in the same PCR if verifying an entirely new plasmid type, e.g. the very first pGP6 plasmid made).
Locus
Number
‘Forward’ primer
‘Reverse’ primer
TRP1
4
prKL652
prKL651
LEU2
5,9
prKL121
prKL790, pKH59
URA3
6
prKL788
prKL789
HIS3
3,8
prKL116
prKL545
HO
None
prKL921
prKL922

	Verifying genomic deletion
Verifying deletion is straightforward: design two genomic primers which bind outside of the deletion. Colony PCR of the deletion strain will produce a short product while colony PCR of the parent strain will produce a long product.

Protocol:
Prep Time: 10 mins if diluted lysates are already available
Protocol Total Time: 3-4 hours

