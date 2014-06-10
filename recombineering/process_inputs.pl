tsk = tasks("recombineering","debug")

step
  note: "tsk = %{tsk}"
end
retval = tsk[0][:specification]

take
  testsamp = item retval[:ldna][0]
end

log
  return: retval
end
