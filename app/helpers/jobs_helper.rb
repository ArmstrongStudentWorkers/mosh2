module JobsHelper

  def get_finalized(finalize)
    if finalize
      "<span class='label label-success'>Ok!</span>".html_safe
    else
      "<span class='label label-important'>Not Finalized</span>".html_safe
    end
  end

  def all_finished(posters)
    posters.map { |p| p.poster_status.name == "Finished" }.reduce{ |a, b| a && b }
  end

  def check_date(due_date)
    due_date < DateTime.now + 2.days
  end

  def get_queue(job)
    if job.job_status.name != "Pending"
      "n/a"
    else
      count = 0
      jobs = JobStatus.where(name: "Pending").first.jobs.where("id < ?", job.id)

      jobs.each do |j|
        count += j.posters.count
      end
      count
    end
  end
end
