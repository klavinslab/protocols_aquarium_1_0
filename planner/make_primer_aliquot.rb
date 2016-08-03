class Protocol

  def put s
    puts "\e[97m  #{s}\e[39m"
  end

  def main

    puts "\e[97mJob #{jid}\e[39m"

    output_collections = {}

    operations.each_with_index do |op,i|

      put "Operation #{op.id} (#{op.name} for #{op.user.name})"

      op.inputs.each do |input|
        input.retrieve
        put "  Input #{input.info}"
      end

      op.outputs.each do |output|

        if output.part?
          output_collections[output.name] ||= output.make_collection(operations.count, 1)
          output.make_part(output_collections[output.name],i,0)
        else
          output.make
        end

        put "  Output #{output.info}"

      end

    end

    put ""

    return {}

  end

end
