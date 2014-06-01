take
  x = item 3689
end

produce silently
  y = 1 "Stripwell"
  data
    matrix: col_new_matrix(4,4)
  end
end

source = x[0][:id]
dest = y[:id]

col_set(dest,2,2,1)

t = col_transfer ( [ source ], [ dest ] )

step
  table: t
  table: col_get_matrix(dest)
  note: "dest(1,1) = " + to_string(col_get(dest,1,1))
end

release x
