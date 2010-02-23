class ShortUrlsController < ApplicationController
  skip_before_filter :verify_authenticity_token
  layout 'default'
  def show
    @url = ShortUrl.find_by_id(params[:id])
    
    if @url
      respond_to do |format|
        format.json { render :json => ShortUrl.new(@url).to_json }
        format.text { render @url }        
      end
    else
      render :status => :not_found, :nothing => true
    end
  end
  
  def create
    @short_url = ShortUrl.new(params[:longUrl])
    
    @short_url.save if @short_url.new_record?
      
    respond_to do |format|
      format.json {render :json => @short_url }
        format.js { render :js => "$('long_url_field').value = '#{@short_url.shortUrl}';" }
        format.html        

    end
  end
end
