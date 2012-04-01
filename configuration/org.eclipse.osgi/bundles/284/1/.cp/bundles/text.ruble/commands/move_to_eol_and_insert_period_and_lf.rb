require 'ruble'
    
command 'Move to EOL and Insert "." + LF' do |cmd|
  cmd.key_binding = 'SHIFT+COMMAND+ENTER'
  cmd.scope = 'text'
  cmd.output = :replace_selection
  cmd.input = :line
  cmd.invoke do |context|
    $stdin.read()[/^(.*?)\s*$/, 1] + ".\n"
  end
end
