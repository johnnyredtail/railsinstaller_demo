require 'ruble'

command 'Convert Character / Selection to Hex' do |cmd|
  cmd.key_binding = 'CONTROL+M2+X'
  cmd.output = :replace_selection
  cmd.input = :selection, :right_character
  cmd.invoke do
    print $stdin.read.unpack("U*").map { |e| sprintf('0x%02x', e) }.join(' ')
  end
end
