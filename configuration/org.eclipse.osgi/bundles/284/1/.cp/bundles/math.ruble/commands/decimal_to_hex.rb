require 'ruble'

command 'Decimal to Hex' do |cmd|
  cmd.key_binding = 'CONTROL+M2+C'
  cmd.output = :replace_selection
  cmd.input = :selection, :word
  cmd.invoke { STDIN.read.to_i.to_s(16) }
end
