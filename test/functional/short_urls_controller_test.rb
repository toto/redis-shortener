require 'test_helper'

class ShortUrlsControllerTest < ActionController::TestCase

  test "creation of a short link" do
    post :create, :longUrl => 'http://example.com'
    assert_response :success
    assert_not_nil assigns(:short_url)
  end
end
