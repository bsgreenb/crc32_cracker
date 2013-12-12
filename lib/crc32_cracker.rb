require "crc32_cracker/version"

module Crc32Cracker
  def self.crc32_crack(start_letter, end_letter, length, salt, hash) # Gets the crc32 code of the given length using the range from a start_letter...end_letter that matches the salt/hash

      (start_letter..end_letter).to_a.repeated_permutation(length.to_i).each do |guess|
        guess = guess.join

        return guess if (crc32_check(guess + salt).to_i == hash.to_i)
      end

    end

  def self.crc32_check(str, js_32_bit = true)
    table = Zlib::crc_table.map {|el| el.to_s(16).upcase} # hex crc32 table

    crc = 0
    crc = crc ^ (-1)

    max_32_int = (2**32)

    str.length.times do |k|
      a = (crc >> 8)
      b = ("0x" + table[((crc ^ str[k].ord ) & 0x000000FF)]).to_i(16)
      crc = (a ^ b)

      if js_32_bit # See http://stackoverflow.com/questions/17056263/getting-the-same-result-from-ruby-as-javascript-for-bitwise-xor?noredirect=1#comment24669730_17056263
        if crc > (max_32_int/2)
          crc = crc - max_32_int
        elsif crc < -(max_32_int/2)
          crc = crc + max_32_int
        end
      end

    end

    crc =  crc ^ (-1)
    crc = crc.abs
    return crc

  end
end
