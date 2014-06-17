take 
  x = 1 "1L Bottle"
end

release x

t = tasks("Gibson","ready")

step
  description: "Current Tasks"
  note: t
end

if length(t) > 0 

  status = get_task_status(t[0])
  name = t[0][:name]

  step
    description: "Change task %{name} status"
    note: "Current status: %{status}"
    getdata
      new: string, "New Status"
    end
  end

  set_task_status(t[0],new)
  status = get_task_status(t[0])

  step
    description: "Changed!"
    note: "New status: %{status}"
  end

end
