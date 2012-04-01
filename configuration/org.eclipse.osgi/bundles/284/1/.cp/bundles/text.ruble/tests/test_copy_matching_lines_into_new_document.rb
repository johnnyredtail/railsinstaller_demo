require 'command_testcase'
require 'copy_matching_lines_into_new_document'

class CopyMatchingLinesIntoNewDocumentTest < CommandTestCase
  
  def command_name
    'Copy Matching Lines into New Document'
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
This
These
There
That
Thiamin
Those
EOL
    Ruble::UI.add_string_for_request("Th*")
    assert_equal(expected, execute(input)) 
    assert_output_type(:create_new_document)  
  end
end