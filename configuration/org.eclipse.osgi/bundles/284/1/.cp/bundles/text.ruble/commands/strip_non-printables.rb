require 'ruble'

command 'Remove Unprintable Characters in Document / Selection' do |cmd|
  cmd.output = :replace_selection
  cmd.input = :selection, :document
  cmd.invoke do
    $stdin.readlines.each {|l| print l.gsub(/[^\t\n\x20-\xFF]|\x7F|\xC2[\x80-\x9F]/n, '') }
    nil
  end
end
