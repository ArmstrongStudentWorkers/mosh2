class PosterMailer < ActionMailer::Base
  default from: "mosh.system@gmail.com"

  def new_job(job_id, current_user_id, date, posters, mounting)
    @user = User.where(id: current_user_id).first
    @date = date
    @url = "http://mosh.c-mccarthy.com/jobs/#{job_id}"
    @posters = posters
    @job_id = job_id
    @mounting = mounting
    mail(to: @user.email, subject: "Your Poster Job ##{job_id}")
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

  def job_denial(job_id, user_id, denial)
    @user = User.where(id: user_id).first
    @url = "http://mosh.c-mccarthy.com/jobs/#{job_id}"
    @job_id = job_id
    @denial = denial
    mail(to: @user.email, subject: "Your Poster Job ##{job_id} has been denied")
  end

  def poster_denial(poster, name, user_id, denial)
    @user = User.where(id: user_id).first
    @url = "http://mosh.c-mccarthy.com/jobs/#{poster.job_id}"
    @denial = denial
    @name = name
    mail(to: @user.email, subject: "Your Poster ##{name} has been denied")
  end

  def mount_poster(poster, date, name, email)
    @date = date
    @url = "http://mosh.c-mccarthy.com/posters/#{poster}"
    @title = name
    @email = email
    mail(to: "armstrong.acm@gmail.com", subject: "Poster Mount Request, due #{date}")
  end
end
