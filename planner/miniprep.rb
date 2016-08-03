class Protocol

  def main

    puts "\e[97mJob #{jid}\e[39m"

    output_collections = {}

    operations.each_with_index do |op,i|

      puts "\e[97m  Operation #{op.id} (#{op.name} for #{op.user.name})\e[39m"

      op.inputs.each do |input|
        input.retrieve
        puts "\e[97m    Input #{input.info}\e[39m"
      end

      op.outputs.each do |output|

        if output.part?

          output_collections[output.name] ||= Collection.new_collection(output.object_type.name, operations.count, 1)
          output.make_part(output_collections[output.name],i,0)

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
