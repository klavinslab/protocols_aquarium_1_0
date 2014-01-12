argument
  fragment_num: number, "Enter the number of fragments being assembled."
end

information "Scarlessly assemble DNA using fragments with terminal homologies."

i=fragment_num
fragment_id_array=[]
fragment_vol_array=[]
fragment_vol_total=0

while i > 0
  step
    description: Enter fragment id and volume
    getdata
      temp_id: string, "fragment id"
      temp_vol: number, "fragment vol"
  end
  
  fragment_vol_total = fragment_vol_total + temp_vol
  
  take
  
  end

end
