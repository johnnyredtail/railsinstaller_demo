require 'ruble'

command "Execute Selection/Line Inserting Results" do |cmd|
  cmd.key_binding = "CTRL+R"
  cmd.output = :insert_as_text
  cmd.input = [ :selection, :line ] 
  cmd.invoke do |context|
    result = ""
    if context['input_type'] == 'line' then result += context.editor.document.legal_line_delimiters[0] end
    result += IO.popen(STDIN.read, 'r') {|io| io.read }
    return result
  end
end