require 'test_helper'

class RedirectControllerTest < ActionController::TestCase
  def setup
    @url = "http://example.com/foo/bar/baz"
    @id = ShortUrl.new(@url).save
  end
  
  test "redirect for url" do
    get :show, :id => @id
    assert_response :redirect
    assert_redirected_to @url
  end
  
  def teardown
    RedisConnection.flushdb
  end
end
