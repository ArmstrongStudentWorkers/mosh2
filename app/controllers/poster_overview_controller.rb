class PosterOverviewController < ApplicationController
  def index
    @jobs = Job.page(params[:page])
  end

  def show
    @poster_overview = PosterOverview.find(params[:id])
    @job = @poster_overview.job
  end

end
