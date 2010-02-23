require 'digest/sha1'
class ShortUrl
  BASE = %w{a b c d e f g h i j k l m n o p q r s t u v w x y z 
            A B C D E F G H I J K L M N O P Q R S T U V W X Y Z 
            0 1 2 3 4 5 6 7 8 9}
  URL_LENGTH = 6
  MAX_NUM_OF_URLS = BASE.size**URL_LENGTH
  
  attr_reader :url, :id, :new_record
  
  
  alias_method :new_record?, :new_record
  
  def initialize(url)
    @url = url

    @id = ShortUrl.find_by_url(@url)
    if @new_record = @id.nil?
      @id = ShortUrl.next_free_id 
    end
  end
  
  def save
    ShortUrl.store[ShortUrl.key_for_url(@url)] = @id
    ShortUrl.store[ShortUrl.key_for_id(@id)] = @url
    @new_record = false
    
    @id
  end
  
  
  def shortUrl
    "#{ShortUrl.base_url}/#{self.id}"    
  end
  
  def to_json(*args)
    {'hash' => self.id,
     'longUrl'  => self.url,
     'shortUrl' => self.shortUrl}.to_json
  end
  
  def self.base_url
    ::BASE_URL
  end
  
  def self.key_for_url(url)
    "url:#{url}"
  end
  
  def self.key_for_id(id)
    "url_id:#{id}"    
  end
  
  def self.find_by_url(url)
    ShortUrl.store[key_for_url(url)]    
  end
  
  def self.find_by_id(id)
    ShortUrl.store[key_for_id(id)]
  end
  
  def self.next_free_id
    the_next_free_id = rand(MAX_NUM_OF_URLS)
    the_next_free_id = next_free_id if find_by_id(the_next_free_id)
    Rails.logger.debug "Next id is #{the_next_free_id}"
    @next_free_id = the_next_free_id.to_s_with_base(BASE, 6)
  end
  
  def self.store
    ::RedisConnection
  end
end
