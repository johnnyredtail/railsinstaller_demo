require 'ruble'
require 'escape'

command 'Join Lines' do |cmd|
  cmd.key_binding = 'CONTROL+M2+J'
  cmd.output = :discard
  cmd.input = :none
  cmd.invoke do |context|
    current_line_number = context.editor.caret_line
    # Don't try to join when it's the last line
    context.exit_discard if (current_line_number == (context.editor.styled_text.line_count - 1))
    
    line_offset = context.editor.styled_text.getOffsetAtLine(current_line_number)    
    end_of_current_line = line_offset + context.editor.current_line.length
    
    document = context.editor.document
    rest_of_doc = document.get(end_of_current_line, document.length - end_of_current_line)
    # find index of first non-space!
    index = rest_of_doc.index(/\S+/)    
    context.editor[end_of_current_line, index] = "" unless index.nil?
  end
end
