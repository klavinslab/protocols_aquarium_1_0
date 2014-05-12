function print(x)
  step
    description: "OUTPUT"
    note: x
  end
end

print(find(:item, { id: 938 }))
print(find(:item, { sample: { name: "pLAB1" } }))
print(find(:item, { sample: { sample_type: { name: "Plasmid" }}}))
print(find(:task, { task_prototype: { name: "Daily" }}))
