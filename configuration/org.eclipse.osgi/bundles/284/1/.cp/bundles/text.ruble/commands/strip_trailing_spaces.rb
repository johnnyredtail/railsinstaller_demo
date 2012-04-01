require 'ruble'

command 'Remove Trailing Spaces in Document / Selection' do |cmd|
  cmd.output = :replace_selection
  cmd.input = :selection, :document
  cmd.invoke do
    $stdin.readlines.each {|l| print l.sub(/[\t ]+$/, '') }
    nil
  end
end
