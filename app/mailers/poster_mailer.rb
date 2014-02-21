class PosterMailer < ActionMailer::Base
  default from: "mosh.system@gmail.com"

  def new_job(poster_overview_id, current_user_id, date)
    @user = User.where(id: current_user_id).first
    @poster_overview = PosterOverview.where(id: poster_overview_id).first
    @date = date
    @url = "http://mosh.c-mccarthy.com:3000/poster_overview/#{poster_overview_id}"
    mail(to: @user.email, subject: "Your Poster Job #{poster_overview_id}")
  end
end
