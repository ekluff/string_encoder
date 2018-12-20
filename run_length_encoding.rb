class RunLengthEncoding
  class << self
    def encode(input)
      input.split(//).chunk{|char| char}.map do |char,chars|
        length = chars.length
        length > 1 ? [length, char] : char
      end.join
    end

    def decode(input)
      input.scan(/(\d*)([a-zA-Z\s]{1})/).map do |group|
        length = group[0].to_i
        length > 0 ? group[1] * length : group[1]
      end.join
    end
  end
end
