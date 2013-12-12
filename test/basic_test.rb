class BasicTest < ActiveSupport::TestCase
  assert Crc32Cracker.crc32_crack("o", "s", "4", "7Knpyl8c", "1986366421") == "pppp" 
end

