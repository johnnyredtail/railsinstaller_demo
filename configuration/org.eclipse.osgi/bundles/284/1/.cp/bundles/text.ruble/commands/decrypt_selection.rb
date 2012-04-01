require 'ruble'
require 'ruble/ui'

command 'AES Decrypt Document / Selection With Password...' do |cmd|
  cmd.key_binding = 'CONTROL+SHIFT+COMMAND+E'
  cmd.output = :replace_selection
  cmd.input = :selection, :document
  cmd.invoke.windows = ""
  cmd.invoke do |context|
    pw = Ruble::UI.request_secure_string(:title => 'Decrypt AES 128 Encrypted Text', :prompt => 'What is the password?', :button1 => 'Decrypt', :button2 => 'Cancel').to_s
    context.exit_discard if pw.nil? or pw.strip.length == 0
    cmd_line = "openssl enc -d -aes128 -base64 -pass \"pass:#{pw}\""
    result = IO.popen(cmd_line, 'r+') do |io|
      io.write $stdin.read
      io.close_write
      io.read
    end
  end
end
