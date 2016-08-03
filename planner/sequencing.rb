class Protocol

  def main

    puts "\e[97mJob #{jid}\e[39m"

    output_collections = {}

    operations = Operation.where(job_id: jid)

    operations.each_with_index do |op,i|

      puts "\e[97m  Operation #{op.id} (#{op.name} for #{op.user.name})\e[39m"

      op.inputs.each do |input|
        input.retrieve
        puts "\e[97m    Input #{input.info}\e[39m"
      end

      op.outputs.each do |output|

        if output.part?

          puts "\e96m  Found output collection of type #{output.field_type.inspect}"

          if output_collections[output.name]
            output.child_item_id = output_collections[output.name].id
          else
            output_collections[output.name] = Collection.new_collection("Stripwell", operations.count, 1)
            output.child_item_id = output_collections[output.name].id
          end

          output_collections[output.name].set i, 0, output.child_sample
          output.row = i
          output.column = 0
          output.save

        else

          output.make

        end

        puts "\e[97m    Output #{output.info}\e[39m"

      end

    end

    puts ""

    return {}

  end

end
