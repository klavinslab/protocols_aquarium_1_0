information "make competent cells for immediate use."argument  shocked_cells: sample , "heat shocked cells"endtake  cells = item shocked_cellsendcells = cells[0]step  description: "wash wash wash!"  note: " transfer to 1.5ml tube."  image: "aphoto"endproduce  competent_cells = 1 "Electrocompetent aliquot" from cells  location: "Bench"  release cellsendlog  return: { comp_cell_id: competent_cells[:id]}end