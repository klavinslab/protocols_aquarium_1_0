class Protocol

  def main

    puts "\e[97mJob #{jid}\e[39m"

    input_collections = {}
    output_collections = {}

    Operation.where(job_id: jid).each do |op|

      puts "\e[97m  Operation #{op.id} (#{op.name} for #{op.user.name})\e[39m"

      op.inputs.each do |input|
        input.retrieve
        puts "\e[97m    Input #{input.info}\e[39m"
      end

      op.outputs.each do |output|

        if output.part?

          puts "  Got a part for #{output.name}. What to do??"
          unless output_collections[output.name]
            puts "  output.object_type.inspect"
          end

        else
          output.make
          puts "\e[97m    Made output #{output.info}\e[39m"
        end

      end

    end

    puts ""

    return {}

  end

end
