require 'command_testcase'
require 'distill_document_selection'

class DistillDocumentSelectionTest < CommandTestCase
  
  def command_name
    'Distill Document / Selection'
  end
  
  def test_with_nil_pattern
    Ruble::UI.add_string_for_request(nil)
    assert_equal(nil, execute(nil))
    assert_output_type(:discard)
  end
  
  def test_distill
    input = <<EOL
This
There
That
Other
Yeah
Those
EOL
    expected = <<EOL
This
There
That
Those
EOL
    Ruble::UI.add_string_for_request("Th*")
    assert_equal(expected, execute(input))
    assert_output_type(:replace_selection)
  end
end