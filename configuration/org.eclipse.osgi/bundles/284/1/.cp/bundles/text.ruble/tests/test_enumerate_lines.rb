require 'command_testcase'
require 'enumerate_lines'

class EnumerateLinesTest < CommandTestCase
  
  def command_name
    'Add Line Numbers to Document / Selection'
  end
  
  def test_enumerate_lines
    input =<<EOL
Testing that we append 
line numbers to this "document".

There's not too many here.

Oh well.

We
should
at least
try to get
more than 10.
EOL
    expected =<<EOL
       1  Testing that we append 
       2  line numbers to this "document".
       3  
       4  There's not too many here.
       5  
       6  Oh well.
       7  
       8  We
       9  should
      10  at least
      11  try to get
      12  more than 10.
EOL
    assert_equal(expected, execute(input))
    assert_output_type(:replace_selection)
  end
end