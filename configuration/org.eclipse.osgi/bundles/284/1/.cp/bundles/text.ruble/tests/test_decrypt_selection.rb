require 'command_testcase'
require 'decrypt_selection'

class DecryptSelectionTest < CommandTestCase
  
  def command_name
    'AES Decrypt Document / Selection With Password...'
  end
  
  def test_decrypt_with_empty_password
    Ruble::UI.add_string_for_request("")
    assert_equal(nil, execute(nil))
    assert_output_type(:discard)
  end
end