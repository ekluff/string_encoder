class RunLengthEncoding
  class << self
    def encode(input)
      input.scan(/(.)(\1*)/).map do |first,rest|
        length = rest.length > 0 ? rest.length + 1 : nil
        [ length, first ]
      end.join
    end

    def decode(input)
      input.scan(/(\d*)([\w\s]{1})/).map do |group|
        length = group[0].to_i
        length > 0 ? group[1] * length : group[1]
      end.join
    end
  end
end
