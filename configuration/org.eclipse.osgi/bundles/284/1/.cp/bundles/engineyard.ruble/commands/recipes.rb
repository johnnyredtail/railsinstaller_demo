require 'engine_yard_tools'


command "Apply Recipes" do |cmd|
  cmd.scope = ['source.ruby', 'project.rails']
  cmd.output = :discard
  cmd.working_directory = :current_project
  cmd.invoke do
    EYCommand.run("recipes apply")
  end
end

command "Upload Recipes" do |cmd|
  cmd.scope = ['source.ruby', 'project.rails']
  cmd.output = :discard
  cmd.working_directory = :current_project
  cmd.invoke do
    EYCommand.run("recipes upload")
  end
end

command "Download Recipes" do |cmd|
  cmd.scope = ['source.ruby', 'project.rails']
  cmd.output = :discard
  cmd.working_directory = :current_project
  cmd.invoke do
    EYCommand.run("recipes download")
  end
end
