require 'engine_yard_tools'

command "Turn Maintenance On" do |cmd|
  cmd.scope = ['source.ruby', 'project.rails']
  cmd.output = :discard
  cmd.working_directory = :current_project
  cmd.invoke do
    EYCommand.run("web disable")
  end
end

command "Turn Maintenance Off" do |cmd|
  cmd.scope = ['source.ruby', 'project.rails']
  cmd.output = :discard
  cmd.working_directory = :current_project
  cmd.invoke do
    EYCommand.run("web enable")
  end
end
