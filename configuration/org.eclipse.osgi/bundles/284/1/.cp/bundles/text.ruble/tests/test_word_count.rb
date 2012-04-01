require 'command_testcase'
require 'word_count'

class WordCountTest < CommandTestCase
  
  def command_name
    'Statistics for Document / Selection (Word Count)'
  end
  
  def test_word_count
    input =<<EOL
Testing how many words 
are in this "document".

There's not too many here.

Oh well.
EOL
    assert_equal("          7 lines\n         15 words\n         86 bytes\n", execute(input))
    assert_output_type(:show_as_tooltip)
  end
end