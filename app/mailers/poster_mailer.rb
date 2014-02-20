class PosterMailer < ActionMailer::Base
  default from: "mosh.system@gmail.com"

  def new_job(job)
    @user = current_user
    @url = 'http://mosh.c-mccarthy.com/jobs/#{job.id}'
    mail(to: @user.email, subject: "Your Poster Job #{job.id}")
  end
end
