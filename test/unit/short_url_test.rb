require 'test_helper'

class ShortUrlTest < ActiveSupport::TestCase
  def setup
    @url = 'http://example.com/foo/bar'
  end
  
  test "creation of not-existing short urls" do
    @id = ShortUrl.new(@url).save
    assert_not_nil @id
    assert_not_equal @id, ""
    assert_equal @url, ShortUrl.find_by_id(@id)
  end
end
