#starts an overnight culture from bacteria


argument
  glycerol_stocks: sample array, "Enter in glycerol stocks of a specific cell of E. Coli you would like to culture."
  plates: sample array, "Enter in plates containing colonies of a strain of E. Coli you would like to culture."
  overnight: sample array, "Enter in exisiting overnights of E. Coli strains you wish to culture."
  antibiotic: string array, "Enter in the antibiotic resistance of the above strains of E. Coli. Enter Amp, Chlor, Kan, Amp+Chlor, Amp+Kan, Chlor+Kan or None."
end

sample_tot=concat(glycerol_stocks, plates)

sample_tot=concat(sample_tot, overnight)

y=length(sample_tot)

if length(glycerol_stocks)>0
  take  
    stocks=item unique(glycerol_stocks) 
  end
end

if length(plates)>0
  take
    plates_id=item unique(plates)
  end
end
  
if length(overnight)>0  
  take
    overnight_id=item unique(overnight)
  end
end

total_taken=concat(glycerol_stocks, plates)
total_taken=concat(total_taken, overnight)

total_takena={id:total_taken}
if length(sample_tot)>1
  step
    description: "Grab %{y} glass 14ml tubes from B1.450 and place them in a plastic tube rack label them 1 through %{y} with a pen"
  end
else
  step
    description: "Grab 1 glass 14ml tube from B1.450 and place it in a plastic tube rack"
  end
end


count1=0
amp_tubes=[0]
amp_tube_count=0

while count1<y
  label1=count1+1
    if antibiotic[count1]=="Amp"
      amp_tubes[amp_tube_count]=label1
      amp_tube_count=amp_tube_count+1
    end
  count1=count1+1
end
  

count2=0
chlor_tubes=[0]
chlor_tube_count=0

while count2<y
  label2=count2+1
    if antibiotic[count2]=="Chlor"
      chlor_tubes[chlor_tube_count]=label2
      chlor_tube_count=chlor_tube_count+1
    end
  count2=count2+1
end

count3=0
kan_tubes=[0]
kan_tube_count=0

while count3<y
  label3=count3+1
    if antibiotic[count3]=="Kan"
      kan_tubes[kan_tube_count]=label3
      kan_tube_count=kan_tube_count+1
    end
  count3=count3+1
end

count4=0
ampchlor_tubes=[0]
ampchlor_tube_count=0

while count4<y
  label4=count4+1
    if antibiotic[count4]=="Amp+Chlor"
      ampchlor_tubes[ampchlor_tube_count]=label4
      ampchlor_tube_count=ampchlor_tube_count+1
    end
  count4=count4+1
end

count5=0
ampkan_tubes=[0]
ampkan_tube_count=0

while count5<y
  label5=count5+1
    if antibiotic[count5]=="Amp+Kan"
      ampkan_tubes[ampkan_tube_count]=label5
      ampkan_tube_count=ampkan_tube_count+1
    end
  count5=count5+1
end

count6=0
chlorkan_tubes=[0]
chlorkan_tube_count=0

while count6<y
  label6=count6+1
    if antibiotic[count6]=="Chlor+Kan"
      chlorkan_tubes[chlorkan_tube_count]=label6
      chlorkan_tube_count=chlorkan_tube_count+1
    end
  count6=count6+1
end

count7=0
TB_tubes=[0]
TB_tube_count=0

while count7<y
  label7=count7+1
    if antibiotic[count7]=="None"
      TB_tubes[TB_tube_count]=label7
      TB_tube_count=TB_tube_count+1
    end
  count7=count7+1
end


if amp_tubes[0] != 0
  step
    description: "Add 3ml of TB+Amp media to tubes %{amp_tubes} using the serological pipette"
  end
end

if kan_tubes[0] != 0
  step
    description: "Add 3ml of TB+Kan media to tubes %{kan_tubes} using the serological pipette"
  end
end

if chlor_tubes[0] != 0
  step
    description: "Add 3ml of TB+Chlor media to tubes %{chlor_tubes} using the serological pipette"
  end
end

if ampkan_tubes[0] != 0
  step
    description: "Add 3ml of TB+Amp+Kan media to tubes %{ampkan_tubes} using the serological pipette"
  end
end

if ampchlor_tubes[0] != 0
  step
    description: "Add 3ml of TB+Amp+Chlor media to tubes %{ampchlor_tubes} using the serological pipette"
  end
end

if chlorkan_tubes[0] != 0
  step
    description: "Add 3ml of TB+Chlor+Kan media to tubes %{chlorkan_tubes} using the serological pipette"
  end
end

if length(glycerol_stocks)>0
  count8=0
  
  step
    description: "Walk to the -80 degree freezer with rack of culture tubes."
  end
  
  while count8<length(glycerol_stocks)
    label=count8+1
    g=glycerol_stocks[count8]
      step
        check:"Remove glycercol stock %{g} from -80 freezer." 
        check:"Carefully open tube and remove a small amount of frozen cells with a pipette tip" 
        check:"Submurge the tip into the liquid culture of tube %{label}, be sure to use sterile technique"
        check:"Discard tip"
        check:"replace cap on glycerol stock and put it back into the -80 freezer"
      end
    count8=count8+1
  end
end


if length(plates)<0
  count9=0
  while count9<length(plates)
    label=length(glycerol_stocks)+count9+1
    p=plates[count9]
      step
        check:"Take a small pipette tip and grab a small amount of colony from plate %{p}. Be sure to use sterile technique."
        check:"Submerge the tip into the liquid culture of the tube %{label}"
        check:"Discard tip"
        note:"Make sure to pick different colonies if creating multiple cultures from the same plate!"
      end
    count9=count9+1
  end
end

if length(overnight)<0
  count10=0
  while count10<length(overnight)
    label = length(glycerol_stocks)+length(plates)+count10+1
    o=overnight[count10]
      step
        check: "Take overnight culture %{o]} and vortex the tube."
        check: "Pipette 3µl of overnight culture %{o} and pipette into tube %{label}"
      end
  end
end

step
  description: "Write the following ID numbers on the the tubes during the following produces. After that make sure caps are on all tubes and place them in B13.425 (large 37ºC shaker incubator)"
end

step
  description: "%{sample_tot}"
end

final_samples=[]

i=0 
j=0
k=0

key_samp_tot={id:sample_tot}

x=length(total_taken)

while i < y
  while j < x
    u=total_takena[j]
    v=key_samp_tot[i]
    if u==v
      final_samples[k]=j
      k=k+1
    end
    j=j+1
  end
  i=i+1
end

count=0
while count < y 
  s = final_samples[count]
  w = plates_id[s] 
    produce
      q=1 "TB Overnight of Plasmid" from w
      location: "Benchtop"
    end
  count=count+1
end
