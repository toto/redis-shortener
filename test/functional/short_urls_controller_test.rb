require 'test_helper'

class ShortUrlsControllerTest < ActionController::TestCase

  def setup
    @url = "http://example.com/foo/bar/#{rand(23)}"
    @id = ShortUrl.new(@url).save    
  end

  test "creation of a short link" do
    post :create, :longUrl => 'http://example.com'
    assert_response :success
    assert_not_nil assigns(:short_url)
  end
  
  test "usage of a short link" do
    get :show, :id => @id
    assert_response :success
  end
  
  def teardown
    RedisConnection.flushdb    
  end
end
