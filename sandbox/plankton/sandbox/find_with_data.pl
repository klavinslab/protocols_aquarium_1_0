i = find(:item,{id: 3732})

step
  note: i[0][:data][:matrix]
end

t = find(:task, { task_prototype: { name: "Daily" }})

step
  note: t[0][:specification][:notes]
  note: t[0][:task_prototype][:prototype][:notes]
end
