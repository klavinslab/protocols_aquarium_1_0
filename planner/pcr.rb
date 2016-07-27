class Protocol

  def main

    Operation.where(job_id: jid).each do |op|
      puts "Operation #{op.id} is part of job #{jid}"
    end

    return {}

  end

end