argument
    oligonucleotides: sample array, "Choose the oligonucleotides you want to make into a master stock"
end

step
    description: "Testing step"
end

produce
  master_stock = 1 "Primer Pool"

end

log
  return: { master_stock: master_stock  }
end
