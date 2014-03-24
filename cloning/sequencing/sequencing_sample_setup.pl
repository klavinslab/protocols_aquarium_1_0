#this protocol describes how to set up a sequencing reaction to send to genewiz


argument 
  plasmids: sample("Plasmid") array, "Enter the plasmids you wish to seqeunce"
  concentrations: number array, "Enter the concentration of the above plasmid samples in ng/µl"
end

y=length(plasmids)

step
  getdata
    
  end
end
