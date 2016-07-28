class Protocol

  def main

    Operation.where(job_id: jid).each do |op|
      puts "\e[91mOperation #{op.id} (#{op.name})\e[39m"
      op.inputs.each do |input|
        puts "\e[91mInput #{input.name}\e[39m"
      end
    end

    return {}

  end

end