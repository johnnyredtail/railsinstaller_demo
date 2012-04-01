require 'command_testcase'
require 'encrypt_selection'


class EncryptSelectionTest < CommandTestCase
  
  def command_name
    'AES Encrypt Document / Selection With Password...'
  end
  
  def test_encrypt_and_decrypt_selection
    input =<<EOL
Testing that we can encrypt
this document.
EOL
    expected = "U2FsdGVkX196qvdYD9cjSZS0QVDdZWgiSDqUz6WC9ZvSHvR2a6YwCrWcpDBrsTbG\n61R0KGpkDl/aSFOq8tfZRg==\n"
    Ruble::UI.add_string_for_request("password")
    Ruble::UI.add_string_for_request("password")
    result = execute(input)
    assert_output_type(:replace_selection)
    # Now decrypt it
    require 'decrypt_selection'
    Ruble::UI.add_string_for_request("password")
    decrypt_cmd = $commands['AES Decrypt Document / Selection With Password...']
    decrypt_context = CommandContext.new
    assert_equal(input, decrypt_cmd.execute(result, decrypt_context))
    assert_equal(:replace_selection, decrypt_context.output)
  end
  
  def test_encrypt_with_empty_password
    Ruble::UI.add_string_for_request("")
    assert_equal(nil, execute(nil))
    assert_output_type(:discard)
  end
  
  def test_encrypt_with_mismatched_password
    Ruble::UI.add_string_for_request("password")
    Ruble::UI.add_string_for_request("doesn't match")
    assert_equal('Password mismatch! Please play again.', execute(nil))
    assert_output_type(:show_as_tooltip)
  end
end