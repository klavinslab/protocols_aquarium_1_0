class Protocol

  def main

    Operation.where(job_id: jid).each do |op|

      puts "\e[91mOperation #{op.id} (#{op.name})\e[39m"

      op.inputs.each do |input|
        input.retrieve
        puts "\e[91mInput #{input.info}\e[39m"
      end

      op.outputs.each do |output|
        output.make
        puts "\e[91mOutput #{output.info}\e[39m"
      end

    end

    return {}

  end

end