require 'command_testcase'
require 'sort_uniq'

class SortUniqTest < CommandTestCase
  
  def command_name
    'Sort Lines & Remove Duplicates'
  end
  
  def test_sort_uniq
    input =<<EOL
1
x
1
a
3
[
3
,
z
a
EOL
    assert_equal(",\n1\n3\n[\na\nx\nz\n", execute(input))
    assert_output_type(:replace_selection)
  end
end