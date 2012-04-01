command 'key: value' do |s|
  s.input = :none
  s.output = :insert_as_snippet
  s.key_binding = 'CONTROL+M2+;'
  s.scope = 'source.yaml - string'
  s.expansion = '${1:key}: ${2:value}$0'
end

