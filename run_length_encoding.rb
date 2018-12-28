class RunLengthEncoding
  class << self
    def encode(input)
      input.scan(/(.)(\1+)?/).map do |first,rest|
        length = rest.length + 1 rescue nil
        [ length, first ]
      end.join
    end

    def decode(input)
      input.scan(/(\d+)?([\w\s]{1})/).map do |group|
        length = ( group[0] || 1 ).to_i
        group[1] * length
      end.join
    end
  end
end
