require 'ruble'

command 'Help: Persistent Includes' do |cmd|
  cmd.scope = 'text.html'
  cmd.output = :show_as_html
  cmd.input = :none
  cmd.invoke do |context|
    File.open("#{ENV['TM_BUNDLE_SUPPORT']}/persistent_includes.html") do |file|
      file.read
    end
  end
end
