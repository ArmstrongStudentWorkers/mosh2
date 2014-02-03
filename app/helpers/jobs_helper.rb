module JobsHelper

  def get_queue(job)
    if job.job_status.name != "Pending" 
      "n/a"
    else
      count = 0
      pending = (Job.where(job_status_id: JobStatus.where(name: "Pending").first.id) && Job.where("id < ?", job.id))
      
      pending.each do |j|
        count += j.posters.count
      end
      count

    end
  end
end
