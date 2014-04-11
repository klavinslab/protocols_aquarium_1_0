require "production/lib/util.pl"

tasks = tasks("Daily","ready")

if length(tasks) == 0

  step
    description: "All daily tasks have been completed."
    note: "Thanks for checking!"
  end

else

  while length(tasks) > 0

    step
      description: "Daily Tasks"
      note: "The following tasks have not been completed today."
      getdata
	name: string, "Choose a task", get_fields(tasks,:name)
      end
    end

    task = get_hash(tasks,:name,name)

    step
      description: task[:name]
      check: task[:specification][:description]
    end

    set_task_status(task,"done")

    log
      TASK: { id: task[:id], name: task[:name] }
    end

    if length(tasks) > 1

      step
        description: "Thank you!"
        getdata
          more: string, "Do you have time to do another daily task?", [ "Yes", "No" ]
        end
      end
     
      if more == "Yes"
        tasks = tasks("Daily","ready")
      else
        tasks = []
      end

    else

      step
        description: "Thank you!"
        note: "There are no more daily tasks."
      end

      tasks = []

    end

  end

end
