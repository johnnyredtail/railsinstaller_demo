require 'command_testcase'
require 'sort'

class SortTest < CommandTestCase
  
  def command_name
    'Sort Lines in Document / Selection'
  end
  
  def test_sort
    input =<<EOL
1
x
a
3
[
,
EOL
    assert_equal(",\n1\n3\n[\na\nx\n", execute(input))
    assert_output_type(:replace_selection)
  end
end