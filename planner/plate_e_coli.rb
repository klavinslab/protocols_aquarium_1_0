class Protocol

  def main

    puts "\e[97mJob #{jid}\e[39m"

    input_collections = {}
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

          if output_collections[output.name]
            output.child_item_id = output_collections[output.name]
          else
            c = Collection.new_collection("Stripwell", operations.count, 1)
            puts "  errors = #{c.errors.full_messages.join(', ')}"
            output_collections[output.name] = c
            output.child_item_id = c.id
          end

          output.row = i
          output.column = 0
          output.save

        else

          output.make

        end

        puts "\e[97m    Made output #{output.info}\e[39m"

      end

    end

    puts ""

    return {}

  end

end
