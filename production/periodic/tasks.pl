require "production/lib/util.pl"

argument
   type: string
end

tasks = tasks(type,"ready")

if length(tasks) == 0

  step
    description: "All daily tasks have been completed."
    note: "Thanks for checking!"
  end

else

  while length(tasks) > 0

    step
      description: "Available %{type} Tasks"
      note: "The following tasks have not been completed today."
      getdata
	name: string, "Choose a task", ha_select(tasks,:name)
      end
    end

    task = ha_get(tasks,:name,name)

    step
      description: task[:name]
      note: task[:specification][:note]
      foreach c in task[:specificaiton][:check]
        check: c
      end
      foreach w in task[:specification][:warning]
        warning: w
       end
    end

    set_task_status(task,"done")

    log
      TASK: { id: task[:id], name: task[:name] }
    end

    if length(tasks) > 1

      step
        description: "Thank you!"
        note: "Aquarium has made a note of your efforts."
        getdata
          more: string, "Do you have time to do another %{type} task?", [ "Yes", "No" ]
        end
      end
     
      if more == "Yes"
        tasks = tasks(type,"ready")
      else
        tasks = []
      end

    else

      step
        description: "Thank you!"
        note: "There are no more %{type} tasks."
      end

      tasks = []

    end

  end

end
