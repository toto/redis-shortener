class Numeric
  BASE = %w{a b c d e f g h i j k l m n o p q r s t u v w x y z 
            A B C D E F G H I J K L M N O P Q R S T U V W X Y Z 
            0 1 2 3 4 5 6 7 8 9}
              
  def to_s_with_base(base=BASE, min_length=nil)
    number = Integer(self);  
    retNum = '';
    while(number != 0)
       retNum = String(BASE[number % BASE.size ] ) + retNum;
       number = number / BASE.size;
    end

    if min_length
      while(retNum.size < min_length)
        retNum = 'a' + retNum
      end
    end
    retNum
  end
end