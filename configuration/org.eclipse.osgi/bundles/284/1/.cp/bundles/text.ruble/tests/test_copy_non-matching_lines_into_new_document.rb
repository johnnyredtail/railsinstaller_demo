require 'command_testcase'
require 'copy_non-matching_lines_into_new_document'

class CopyNonMatchingLinesIntoNewDocumentTest < CommandTestCase
  
  def command_name
    'Copy Non-Matching Lines into New Document'
  end
  
  def test_nil
    assert_equal(nil, execute(""))
    assert_output_type(:discard)
  end
  
  def test_pattern
    input =<<EOL
This
These
There
That
Bogus!
Thiamin
Those
EOL
    expected =<<EOL
Bogus!
EOL
    Ruble::UI.add_string_for_request("Th*")
    assert_equal(expected, execute(input)) 
    assert_output_type(:create_new_document)  
  end
end