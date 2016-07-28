class Protocol

  def main

    puts "Job #{jid}"

    Operation.where(job_id: jid).each do |op|

      puts "\e[97mOperation #{op.id} (#{op.name} for #{op.user.name})\e[39m"

      op.inputs.each do |input|
        input.retrieve
        puts "\e[97m  Input #{input.info}\e[39m"
      end

      op.outputs.each do |output|
        output.make
        puts "\e[97m  Output #{output.info}\e[39m"
      end

    end

    return {}

  end

end