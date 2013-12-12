require "test/unit"
require "crc32_cracker"

class Crc32CrackerTest < Test::Unit::TestCase
  
  def test_basic
    assert Crc32Cracker.crc32_crack("o", "s", "4", "7Knpyl8c", "1986366421") == "pppp"
  end
  
end


