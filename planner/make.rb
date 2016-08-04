protocols = [ 
  "order_primer.rb",
  "receive_primer.rb",
  "make_primer_aliquot.rb",
  "pcr.rb",
  "run_gel.rb",
  "extract_fragment.rb",
  "purify_gel.rb",
  "gibson_assembly.rb",
  "transform_e_coli.rb",
  "plate_e_coli.rb",
  "check_e_coli_plate.rb",
  "e_coli_overnight.rb",
  "miniprep.rb",
  "sequencing.rb"
]

  protocols.each do |p|

    system("cp default.rb #{p}")

  end