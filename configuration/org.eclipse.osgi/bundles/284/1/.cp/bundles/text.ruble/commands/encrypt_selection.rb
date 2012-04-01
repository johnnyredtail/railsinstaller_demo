require 'ruble'
require 'ruble/ui'

command 'AES Encrypt Document / Selection With Password...' do |cmd|
  cmd.key_binding = 'CONTROL+SHIFT+COMMAND+E'
  cmd.output = :replace_selection
  cmd.input = :selection, :document
  cmd.invoke.windows = ""
  cmd.invoke do |context|
    pw = Ruble::UI.request_secure_string(:title => 'Encrypt Text With AES 128', :prompt => 'What password should be used?', :button1 => 'Continue', :button2 => 'Cancel').to_s
    context.exit_discard if pw.nil? or pw.strip.length == 0
    pw2 = Ruble::UI.request_secure_string(:title => 'Encrypt Text With AES 128', :prompt => 'Enter password again to verify.', :button1 => 'Encrypt', :button2 => 'Cancel').to_s
    context.exit_show_tool_tip 'Password mismatch! Please play again.' unless pw == pw2
    cmd_line = "openssl enc -e -aes128 -base64 -pass \"pass:#{pw}\""
    result = IO.popen(cmd_line, 'r+') do |io|
      io.write $stdin.read
      io.close_write
      io.read
    end
  end
end
