class Protocol

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

  ###########
  # TODO: 
  #   - Choose specific object and/or sample
  #   - For a given object type / sample, find all items available to purchase
  #   - Choose the particular item
  #   - Create a task to enable the purchase (will need a new task prototype)
  #

  def main

    basics = ObjectType.all.select { |ot|
      purchase_info(ot) == "basic"
    }

    samples = ObjectType.all.select { |ot|
      purchase_info(ot) == "sample"
    }

    collections = ObjectType.all.select { |ot|
      purchase_info(ot) == "collection"
    }

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
        
        result = show do
          title "#result[:choice] Costs"
          note "Material: #{currency ot.data_object[:materials]}"
          note "Labor: #{currency ot.data_object[:labor]}"
          select [ "Ok", "Cancel" ], var: "choice", label: "Choose item", default: 0
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

  end

end
