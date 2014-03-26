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
  label=count1+1
    if antibiotic[count1]=="Amp"
      amp_tubes[amp_tube_count]=label
      amp_tube_count=amp_tube_count+1
    end
  count1=count1+1
end
  

count2=0
chlor_tubes=[0]
chlor_tube_count=0

while count2<y
  label=count2+1
    if antibiotic[count2]=="Chlor"
      chlor_tubes[chlor_tube_count]=label
      chlor_tube_count=chlor_tube_count+1
    end
  count2=count2+1
end

count3=0
kan_tubes=[0]
kan_tube_count=0

while count3<y
  label=count1+1
    if antibiotic[count3]=="Kan"
      kan_tubes[kan_tube_count]=label
      kan_tube_count=kan_tube_count+1
    end
  count3=count3+1
end

count4=0
ampchlor_tubes=[0]
ampchlor_tube_count=0

while count1<y
  label=count4+1
    if antibiotic[count4]=="Amp+Chlor"
      ampchlor_tubes[ampchlor_tube_count]=label
      ampchlor_tube_count=ampchlor_tube_count+1
    end
  count4=count4+1
end

count5=0
ampkan_tubes=[0]
ampkan_tube_count=0

while count1<y
  label=count5+1
    if antibiotic[count5]=="Amp+Kan"
      ampkan_tubes[ampkan_tube_count]=label
      ampkan_tube_count=ampkan_tube_count+1
    end
  count5=count5+1
end

count6=0
chlorkan_tubes=[0]
chlorkan_tube_count=0

while count6<y
  label=count6+1
    if antibiotic[count6]=="Chlor+Kan"
      chlorkan_tubes[chlorkan_tube_count]=label
      chlorkan_tube_count=chlorkan_tube_count+1
    end
  count6=count6+1
end

count7=0
TB_tubes=[0]
TB_tube_count=0

while count7<y
  label=count7+1
    if antibiotic[count7]=="None"
      TB_tubes[TB_tube_count]=label
      TB_tube_count=TB_tube_count+1
    end
  count7=count7+1
end


if amp_tubes[0] != 0
  step
    description: "Add 3ml of TB+Amp media to tubes %{amp_tubes}"
  end
end





