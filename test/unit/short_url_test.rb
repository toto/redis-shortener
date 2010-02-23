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
  
  test "should not multiple short versions of the same url" do
    @id = ShortUrl.new(@url).save
    @id2 = ShortUrl.new(@url).save    
    assert_equal(@id, @id2)
  end
  
  def teardown
    RedisConnection.flushdb
  end
end
