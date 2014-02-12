module JobsHelper

  def get_job_status(status)
    if status == "Pending"
      "<span class='label label-warning'>#{status}</span>".html_safe
    else if status == "Finished"
      "<span class='label label-success'>#{status}</span>".html_safe
    else if status == "Denied"
      "<span class='label label-important'>#{status}</span>".html_safe
    else

    end
  end

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
