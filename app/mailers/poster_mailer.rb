class PosterMailer < ActionMailer::Base
  default from: "mosh.system@gmail.com"

  def new_job(poster_overview_id, current_user_id, date, posters)
    @user = User.where(id: current_user_id).first
    @poster_overview = PosterOverview.where(id: poster_overview_id).first
    @date = date
    @url = "http://mosh.c-mccarthy.com/poster_overview/#{poster_overview_id}"
    @posters = posters
    mail(to: @user.email, subject: "Your Poster Job ##{poster_overview_id}")
  end

  def new_job_alert(user_id, date, job_id)
    @user = User.where(id: user_id).first
    @date = date
    @url = "http://mosh.c-mccarthy.com/jobs/#{job_id}"
    @job_id = job_id
    mail(to: "mosh.system@gmail.com", subject: "New Poster Job ##{job_id} received, due #{date}")
  end

  def job_finished(job_id, user_id)
    @user = User.where(id: user_id).first
    @job_id = job_id
    mail(to: @user.email, subject: "Your Poster Job ##{job_id} is complete")
  end

  def job_finished_alert(job_id, user_id)
    @user = User.where(id: user_id).first
    @job_id = job_id
    mail(to: "mosh.system@gmail.com", subject: "Poster Job ##{job_id} is complete")
  end
end
