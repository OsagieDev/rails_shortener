class UrlsController < ApplicationController
  def index
    @urls = Url.all
  end

  def new
    @url = Url.new
  end

  def show
    @url = Url.where(short_url: params[:short_url]).first
    @url.update_click_count
    redirect_to @url.long_url
  end

  def create
    @url = Url.new(url_params)
    @url.set_short_url

    if @url.save
      redirect_to root_path
    else
      render @url
    end
  end

  def destroy
    @url = Url.find(params[:id])
    @url.destroy
    redirect_to root_path
  end

  private

  def url_params
    params.require(:url).permit(:long_url)
  end
end
