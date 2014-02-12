argument
  
  comb_sample : sample, "The combined (Denatured and Diluted PhiX Control +  Denatured and Diluted sample library) sample library"

end

step
  
  description : "This protocol describes the process to load te sample library to MiSeq and run sequencing process"
  
end

take 

  comb_sample_1 = item comb_sample
  
end

step 
  
  description : "Load the library"
  check : "Using a 1 mL pippet tube pierce the foil of the reservoir labled Load Sample"
  warning : "Do not pierce the foil of any other reservoirs. They will be pierced automatically durin run"
  check : "Load 600 uL of the combined sample libraries to the Load Reservoir"
  warning : "Do not touch the foil seal while loading the sample"
  
end

step 

  description : "Run Sequencing"
  
end
