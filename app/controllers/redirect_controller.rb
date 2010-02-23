class RedirectController < ApplicationController
  def show
    @url = ShortUrl.find_by_id(params[:id])
    
    if @url
      redirect_to @url, :status => :moved_permanently
    else
      render :template => File.join(Rails.root, 'public', '404.html'), :status => :not_found
    end    
  end
end
