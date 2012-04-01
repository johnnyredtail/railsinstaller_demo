require 'command_testcase'
require 'convert_to_hex'

class ConvertToHexTest < CommandTestCase
  
  def command_name
    "Convert Character / Selection to Hex"
  end
  
  def test_14
    assert_equal("0x31 0x34", execute("14"))
    assert_output_type(:replace_selection)
  end
end