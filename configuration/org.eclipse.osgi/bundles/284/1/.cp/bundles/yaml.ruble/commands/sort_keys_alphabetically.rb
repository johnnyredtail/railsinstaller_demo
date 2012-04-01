require 'ruble'

command 'Sort Keys Alphabetically' do |cmd|
  # cmd.key_binding = 'F6' # Commented out to avoid clashes with debugger
  cmd.scope = 'source.yaml'
  cmd.output = :replace_selection
  cmd.input = :selection
  cmd.invoke do
    (s = STDIN.read).split(/^#{indent = s.scan(/^(\s*)\b/).flatten.first}(?=\w)/).sort.join(indent)
  end
end
