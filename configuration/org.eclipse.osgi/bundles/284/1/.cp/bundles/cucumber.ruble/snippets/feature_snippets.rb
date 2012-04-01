# Feature snippets
with_defaults :scope => 'text.cucumber.feature' do
  
snippet 'Scenario (heading only)' do |s|
  s.trigger = 'sc'
  s.expansion = 'Scenario: ${1:title}
$0
'
end

snippet 'Scenario Outline' do |s|
  s.trigger = 'sco'
  s.expansion = 'Scenario Outline: ${1:title}
  Given ${2:context}
  When ${3:event}
  Then ${4:outcome}
'
end

snippet 'Scenario' do |s|
  s.trigger = 'sce'
  s.expansion = 'Scenario: ${1:title}
  Given ${2:context}
  When ${3:event}
  Then ${4:outcome}
$0
'
end

# FIXME This seems to be inserted with a preceding newline for seom reason...
command 'Feature' do |s|
  s.trigger = 'fea'
  s.input = :none
  s.output = :insert_as_snippet
  s.invoke do |context|  
    title = (ENV['TM_FILENAME'] || 'title').gsub(/\..*$/, '').gsub(/[-_]/, ' ')
    title = title[0..0].upcase + title[1..-1].downcase
"Feature: ${1:#{title}}
  In order to ${2:value}
  As a ${3:role}
  I want ${4:feature}

  $0
"
  end
end

snippet 'Then Step Plaintext' do |s|
  s.trigger = 'the'
  s.expansion = 'Then ${1:outcome}'
end

snippet 'When Step Plaintext' do |s|
  s.trigger = 'whe'
  s.expansion = 'When ${1:event}'
end

end
