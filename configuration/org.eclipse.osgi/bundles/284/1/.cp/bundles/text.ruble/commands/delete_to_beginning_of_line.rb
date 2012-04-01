require 'ruble'
# FIXME Something is interfering so keybinding doesn't actually work (though the command works fine when run from menu)!
command 'Delete to Beginning of Line' do |cmd|
  cmd.key_binding = 'COMMAND+BACKSPACE'
  cmd.output = :discard
  cmd.input = :none
  cmd.invoke do |context|
    current_line_number = context.editor.caret_line    
    line_offset = context.editor.styled_text.getOffsetAtLine(current_line_number)
    length = context.editor.caret_offset - line_offset
    context.editor[line_offset, length] = ""
  end
end
