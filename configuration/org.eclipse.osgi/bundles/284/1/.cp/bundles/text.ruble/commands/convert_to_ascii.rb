require 'ruble'

# FIXME This probably won't work on windows
command 'Transliterate Word / Selection to ASCII' do |cmd|
  cmd.output = :replace_selection
  cmd.input = :selection, :word
  cmd.invoke =<<-EOF
iconv -c -f utf-8 -t ASCII//TRANSLIT
EOF
end
