require 'ruble'
# FIXME Won't work on Windows, or Ubuntu. Run 'espeak' on Ubuntu!
command 'Speak Document / Selection' do |cmd|
  cmd.output = :discard
  cmd.input = :selection, :document
  cmd.invoke do
    # TODO Allow cancelling job in UI to actually stop the process run here!
    job = Ruble::Job.new("Speaking...") { `say \`echo "#{STDIN.read}"\` &` }
    job.schedule
    nil
  end
 cmd.invoke.windows do
   say_command = "cmd /Q /C \"\"#{ENV['TM_BUNDLE_SUPPORT']}\\say\" "
   if ENV['TM_SELECTED_TEXT']
     # We have a selection
     say_command += "\"#{ENV['TM_SELECTED_TEXT']}\"\""
   else
     # Say the entire file
     say_command += "\"#{ENV['TM_SELECTED_FILE']}\" true\""
   end
   job = Ruble::Job.new("Speaking..."){ `"#{say_command}"` }
   job.schedule
   nil
 end
end
