class PosterMailer < ActionMailer::Base
  default from: "mosh.system@gmail.com"

  def new_job(poster_overview_id, current_user_id, date, posters)
    @user = User.where(id: current_user_id).first
    @poster_overview = PosterOverview.where(id: poster_overview_id).first
    @date = date
    @url = "http://mosh.c-mccarthy.com:3000/poster_overview/#{poster_overview_id}"
    @posters = posters
    mail(to: @user.email, subject: "Your Poster Job #{poster_overview_id}")
  end

  def new_job_alert(current_user_id, date, job_id)
    @user = User.where(id: current_user_id).first
    @date = date
    @url = "http://mosh.c-mccarthy.com:3000/jobs/#{job_id}"
    @job_id = job_id
    mail(to: "mosh.system@gmail.com", subject: "New Poster Job received, due #{date}")
  end

end
