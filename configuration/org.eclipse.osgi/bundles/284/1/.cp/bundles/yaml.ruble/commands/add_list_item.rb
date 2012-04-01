require 'ruble'

command 'Add list item' do |cmd|
  cmd.key_binding = 'NUMPAD_ENTER'
  cmd.scope = 'source.yaml'
  cmd.output = :insert_as_snippet
  cmd.input = :selection, :line
  cmd.invoke do
    line = STDIN.read
    TAB = line.match(/^(\s+)/).to_s
    
    # first check to see if we have a
    # key on the current line, if so indent
    if ENV['TM_CURRENT_LINE'].match /^\s*.+:/
      $stdout.write "#{line}\n#{TAB}\t- " 
    
    # then to see if it's a one-liner list item,
    # in which case we don't indent
    elsif ENV['TM_CURRENT_LINE'].match /^\s*- /
      $stdout.write "#{line}\n#{TAB}- "
    
    # otherwise back up indent
    else 
      $stdout.write "#{line}\n#{TAB[(0..-3)]}- "
    end    
    nil
  end
end
