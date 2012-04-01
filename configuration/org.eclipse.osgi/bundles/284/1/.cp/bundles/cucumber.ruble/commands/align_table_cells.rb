require 'ruble'

command 'Align Table Cells' do |cmd|
  cmd.key_binding = 'M1+M2+F'
  cmd.scope = 'text.cucumber.feature'
  cmd.output = :replace_selection
  cmd.input = :selection, :document
  cmd.invoke do
    require ENV['TM_BUNDLE_SUPPORT'] + "/cucumber/mate/table_aligner"    
    puts(Cucumber::Mate::TableAligner.new.align(STDIN.readlines))
  end
end
