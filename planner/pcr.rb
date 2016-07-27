class Protocol

  def main

    Operation.where(job_id: jid).each do |op|
      puts "\e[91mOperation #{op.id} is part of job #{jid}\e[39m"
    end

    return {}

  end

end