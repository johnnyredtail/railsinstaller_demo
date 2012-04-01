require 'command_testcase'
require 'move_to_eol_and_insert_period'

class MoveToEOLAndInsertPeriodTest < CommandTestCase
  
  def command_name
    'Move to EOL and Insert "."'
  end
  
  def test_insert_period
    assert_equal("end of line.", execute("end of line"))
    assert_output_type(:replace_selection)
  end
end