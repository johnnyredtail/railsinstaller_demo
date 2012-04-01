require 'ruble'

command 'Randomize Lines in Document / Selection' do |cmd|
  cmd.output = :replace_selection
  cmd.input = :selection, :document
  cmd.invoke do
    $stdin.readlines.sort { rand(3) - 1 }.join('')
    #$stdin.readlines.sort_by { rand }.join('')
  end
end
