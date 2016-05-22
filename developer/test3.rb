# Title: Inventory Purchase Protocol
# Author: Eric Klavins
# Date: May 21, 2016
# 

class Protocol

  def main
      
    show do
        title Module.const_get("TaskPrototype").last.name    
    end

    @job = Job.find(jid)
    @user = User.find(@job.user_id)
    user = @user # Can't put @user in show, becuase it would refer to the rwong object

    result = show do
      note "User: #{user.name} (#{user.login})"
      select user.budget_info.collect { |bi| bi[:budget].name }, var: "choice", label: "Choose a budget", default: 0
    end
    
    @budget = Budget.find_by_name(result[:choice])

    object_types = ObjectType.all
    basics = object_types.select { |ot| purchase_info(ot) == "basic" }
    samples = object_types.select { |ot| purchase_info(ot) == "sample" }
    collections = object_types.select { |ot| purchase_info(ot) == "collection" }

    result = show do
      title "Select Category"
      note "Basics: e.g. tubes and tip boxes"
      note "Samples: e.g. media"
      note "Batched: e.g. Gibson Aliquots and plates"
      select [ "Basics", "Samples", "Batched" ], var: "choice", label: "Choose something", default: 0
    end

    case result[:choice]

      when "Basics"

        result = show do
          title "Chose Item"
          select basics.collect { |ot| ot.name }, var: "choice", label: "Choose item", default: 0
        end

        ot = basics.find { |b| b.name == result[:choice] }
        m = currency(ot.data_object[:materials])
        l = currency(ot.data_object[:labor])
        
        result = show do
          title "#{result[:choice]} Costs"
          note "Material: #{m}"
          note "Labor: #{l}"
          select [ "Ok", "Cancel" ], var: "choice", label: "Choose item", default: 0
        end
        
        if result[:choice] == "Ok"
          make_purchase result[:choice], ot.data_object[:materials], ot.data_object[:labor]
        else
          show do
              title "Canceled purchase"
          end
        end
        
      when "Samples"

        show do
          title "Chose Item"
          select samples.collect { |ot| ot.name }, var: "choice", label: "Choose sample", default: 0
        end

      when "Batched"

        show do
          title "Chose Batch Item"
          select collections.collect { |ot| ot.name }, var: "choice", label: "Choose batch item", default: 0
        end

    end

    return {
      user: @user.login,
      job: @job.id
    }

  end
  
  def make_purchase description, mat, lab
    tp = Module.const_get("TaskPrototype").find_by_name("Direct Purchase")
    if tp
      task = tp.tasks.create({
        user_id: @user.id, 
        name: "direct_purchase_#{DateTime.now.to_i}",
        status: "purchased",
        budget_id: @budget.id,
        specification: {
            description: description,
            materials: mat,
            labor: lab
         }
      })
      task.save
      unless task.errors.empty?
        show do
          title "Errors"
          note task.errors.full_messages.join(', ')
      end
    end
  end
  
  def purchase_info ot

    if ot.data_object[:materials] && ot.data_object[:labor]
      "basic"
    elsif ot.handler == "sample_container" && ot.data_object[:samples]
      "sample"
    elsif ot.handler == "collection" && ot.data_object[:samples]
      "collection"
    else
      nil
    end

  end 

  def currency num
    ActionController::Base.helpers.number_to_currency num
  end  

end
