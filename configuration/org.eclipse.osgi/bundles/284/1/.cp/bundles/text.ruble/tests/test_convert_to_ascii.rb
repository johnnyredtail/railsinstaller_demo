require 'command_testcase'
require 'convert_to_ascii'

class ConvertToAsciiTest < CommandTestCase
  
  def command_name
    "Transliterate Word / Selection to ASCII"
  end
  
  def test_thing
    assert_equal("hello world!\n", execute("hello world!"))
    assert_output_type(:replace_selection)
  end
end