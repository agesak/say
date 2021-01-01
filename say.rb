class Say

  # mod solution from: https://www.youtube.com/watch?v=qwotMTggot0
  # this explanation is better: https://www.youtube.com/watch?v=9FmEowPl2Rg

  # SINGLE_HASH = {0 => "zero", 1 => "one", 2 => "two", 3 => "three", 4 => "four", 5 => "five", 6 => "six", 7 => "seven", 8 => "eight", 9 => "nine", 10 => "ten"}

  # TEENS_HASH = {10 => "ten", 11 => "eleven", 12 => "twelve", 13 => "thirteen", 14 => "fourteen", 15 => "fifteen", 16 => "sixteen", 17 => "seventeen", 18 => "eighteen", 19 => "nineteen"}

  # DOUBLE_DIGIT_HASH = {2 => "twenty", 3 => "thirty", 4 => "forty", 5 => "fifty", 6 => "sixty", 7 => "seventy", 8 => "eighty", 9 => "nintety"}
  SINGLE_HASH2 = {0 => "zero", 1 => "one", 2 => "two", 3 => "three", 4 => "four", 5 => "five", 6 => "six", 7 => "seven", 8 => "eight", 9 => "nine", 10 => "ten",  11 => "eleven", 12 => "twelve", 13 => "thirteen", 14 => "fourteen", 15 => "fifteen", 16 => "sixteen", 17 => "seventeen", 18 => "eighteen", 19 => "nineteen"}

  DOUBLE_DIGIT_HASH2 = {2 => "twenty", 3 => "thirty", 4 => "forty", 5 => "fifty", 6 => "sixty", 7 => "seventy", 8 => "eighty", 9 => "nintety"}

  CATEGORIES = {0 => "", 1 => "thousand", 2 => "million", 3 => "billion"}

  attr_reader :number

  def initialize(number)
      @number = number
  end

  # def in_english
  #   raise ArgumentError.new("outside of range") if @number <0 || @number >  999999999999

  #   digits = @number.to_s.split("").map{|x| x.to_i}
  
    
  #   return SINGLE_HASH[@number] if SINGLE_HASH[@number]
  #   return TEENS_HASH[@number] if TEENS_HASH[@number]
  #   return helper(digits) if helper(digits)
  
  #   chunks = digits.reverse.each_slice(3).to_a.map{|x| x.reverse }.reverse
  #   output_string = ""
  #   if chunks.length == 2
  #     output_string = output_string + helper(chunks[0]) + " thousand "
  #     output_string += helper(chunks[1])
  #   end
  
  #   if chunks.length == 3
  #     output_string = output_string + helper(chunks[0]) + " million "
  #     if chunks[1].any?{|x| x != 0}
  #       output_string = output_string + helper(chunks[1]) + " thousand "
  #     end
  #     output_string += helper(chunks[2])
  #   end
  
  #   if chunks.length == 4
  #     output_string = output_string + helper(chunks[0]) + " billion "
  #     if chunks[1].any?{|x| x != 0}
  #       output_string = output_string + helper(chunks[1]) + " million "
  #     end
  #     if chunks[2].any?{|x| x != 0}
  #       output_string = output_string + helper(chunks[2]) + " thousand "
  #     end
  #     output_string += helper(chunks[3])
  #   end
  
  #   return output_string.strip
  # end

  # def helper(digits)

  #   return SINGLE_HASH[digits[0]] if digits.length == 1

  #   # 2 digit number
  #   output_string = ""
  #   if digits.length == 2
  #     output_string += DOUBLE_DIGIT_HASH[digits[0]]
  #     if digits[1] == 0
  #       return output_string
  #     else
  #       return output_string + "-" + SINGLE_HASH[digits[1]]
  #     end
  #   end
  
  #   # 3 digit number
  #   if digits.length == 3
  #     if SINGLE_HASH[digits[0]] != "zero"
  #       output_string = SINGLE_HASH[digits[0]] + " hundred "
  #     end
  #     if DOUBLE_DIGIT_HASH[digits[1]]
  #       output_string = output_string + DOUBLE_DIGIT_HASH[digits[1]]
  #       if SINGLE_HASH[digits[2]] != "zero"
  #         return output_string + "-" + SINGLE_HASH[digits[2]]
  #       end
  #       return output_string
  #     elsif TEENS_HASH[digits[1..2].join.to_i]
  #       return output_string + TEENS_HASH[digits[1..2].join.to_i]
  #     else
  #       if SINGLE_HASH[digits[2]] != "zero"
  #         return output_string += SINGLE_HASH[digits[2]]
  #       end
  #       return output_string.strip
  #     end
  #     return output_string + SINGLE_HASH[digits.join.to_i]
  #   end
  
  # end



  def in_english()
    raise ArgumentError.new("outside of range") if @number <0 || @number >  999999999999

    if @number == 0 
      return "zero"
    end

    answer = ""
    index = 0
    while @number > 0
      if @number % 1000 > 0
        idk = ""
        idk = helper_2(idk, @number % 1000)
        p idk
        idk = idk + CATEGORIES[index] + " "
        answer.prepend(idk)
        # p answer
      end
      index += 1
      @number = @number / 1000
      # p number
    end

    return answer.strip.chomp("-")
  end

  def helper_2(string, num)
    # p string
    if num == 0
      return string
    elsif num < 20
      return string + SINGLE_HASH2[num] + " "
    elsif num < 100
      string =  string + DOUBLE_DIGIT_HASH2[num/10] + "-"
      helper_2(string, num % 10)
    else
      string = string + SINGLE_HASH2[num / 100] + " hundred "
      helper_2(string, num % 100 )
    end
  end
end