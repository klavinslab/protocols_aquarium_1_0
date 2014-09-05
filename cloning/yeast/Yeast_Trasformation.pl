argument
  products: string array, "The exact name of each strain the transformations will produce."
  frozen_aliquots: sample("Yeast Strain") array, "Enter in the frozen aliquots you would like to transform your digested plasmids into."
  digested_plasmids: sample("Plasmid") array, "Enter the digested plasmid samples you want transformed into the strains above."
  plate_type: number array, "Enter a number that corresponds to a given plate type for each transformation. 1= -His Plate, 2= -Trp Plate, 3= -Ura Plate, 4= -Leu Plate"
  rescue_vol: number, "Enter the amount of molecular grade water you would like to resuce the competent aliquots with."
end

  
 
y=length(frozen_aliquots)

h = 0
t = 0
u = 0
l = 0

plate_names=[]

x=0
while x < y
  if plate_type[x]==1
    h=h+1
    plate_names[x]="His Plate"
  elsif plate_type[x]==2
    t=t+1
    plate_names[x]="Trp Plate"
  elsif plate_type[x]==3
    u=u+1
    plate_names[x]="Ura Plate"
  elsif plate_type[x]==4
    l=l+1
    plate_names[x]="Leu Plate"
  end
  x=x+1
end

take
  j= item unique(digested_plasmids)
end

take
  h "SDO -His Plate (sterile)"
  u "SDO -Ura Plate (sterile)"
  l "SDO -Leu Plate (sterile)"
  t "SDO -Trp Plate (sterile)"
end


step
  description: "Go to the the M20 and remove %{y} boiled salmon sperm DNA frozen aliquots."
end

take
  k = item unique(frozen_aliquots)
end

tbl = [["Tube Label", "Frozen Aliquot ID"]]
ii = 0 
while ii<y
  tbl = append(tbl,[ii+1,frozen_aliquots[ii]])
  ii = ii+1
end

step
  description: "Refer to the table below and label each frozen aliquot with the corresponding tube label"
  note: "put all of the frozen aliquots in order in a tube rack" 
  table: tbl
end

step
  description: "Check off the boxes as you complete each step."
  check: "Add 240µl of 50 percent PEG into each frozen aliquot tube."
  warning: "Be careful when pipetting PEG as it is very viscus. Pipette slowly"
  check: "Add 36µl of 1M lithium acetate to each tube"
  check: "Add 25µl of boiled salmom sperm to each tube"
end

tbl1 = [["Tube Label", "Digested Plasmid"]]
i1 = 0 
while i1<y
  tbl1 = append(tbl1,[i1+1,digested_plasmids[i1]])
  i1 = i1+1
end

step
  description:"Add the full contents (50µl) of the digested plasmid stocks to their coressponding tube lables in the table below."
  table: tbl1
end

step
  description:"Vortex all the tubes and place them on the 40º C heat block in B5.330 for 12 minutes"
end

step
  timer: { hours: 0, minutes: 12, seconds: 0 }
end

step
   description: "Check off the boxes as you complete each step."
   check: "Spin down the tubes for 20 seconds on the tabel top centrifuge and discard the supernatant."
   check: "pippet %{rescue_vol}µl of Molecular Grade water into each tube."
   warning: "The resuce volume changes based on the users preference."
   check: "vortex each tube to resuspend cells."
   warning: "Make sure you vigorously vortex the tubes. If some cells are still stuck on the bottom of the tubes try raking the tube quickly across a small 1.5ml tube rack to loosen them."
end

tbl2 = [["Tube Label", "Plate Type"]]
i2 = 0 
while i2<y
  tbl2 = append(tbl2,[i2+1,plate_names[i2]])
  i2 = i2+1
end

step
  description: "Add the contents of each tube to the corresponding plate type. Be sure to label the plate with the same tube label after the contents are pipetted."
  table: tbl2
end

step
  description: "Pour 3-10 sterile beads in each of the plates and shake plates until they are dry."
end

step
  description: "The following step will produce yeast plates in numerical order of the plate labels."
end

release [j]

x=0
while x < y
  produce
    q = 1 "Yeast Plate" of products[x]
    location: "30º Incubator"
    release k[x]
  end
  x = x+1
end


