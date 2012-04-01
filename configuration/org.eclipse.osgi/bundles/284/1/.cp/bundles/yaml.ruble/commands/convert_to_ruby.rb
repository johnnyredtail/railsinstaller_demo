require 'ruble'

command 'Convert Document / Selection to Ruby' do |cmd|
  cmd.key_binding = 'CONTROL+M2+H'
  cmd.scope = 'source.yaml'
  cmd.output = :create_new_document
  cmd.input = :selection, :document
  cmd.invoke do
    output = "#!/usr/bin/env ruby\n\n"
    output << "documents = "
    cmd_line = "ruby -e \"require 'yaml'; require 'pp'; pp(YAML.load_stream(STDIN).documents)\""
    output << IO.popen(cmd_line, 'r+') {|io| io.write STDIN.read; io.close_write; io.read }
  end
end
