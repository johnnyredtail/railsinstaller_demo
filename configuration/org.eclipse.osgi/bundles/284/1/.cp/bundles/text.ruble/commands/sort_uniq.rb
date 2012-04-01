require 'ruble'
# FIXME used to run "sort -f" which sorts things like [ after a-z, but ruby sorts before a-z
command 'Sort Lines & Remove Duplicates' do |cmd|
  # cmd.key_binding = 'F6' # Commented out to avoid clashes with debugger
  cmd.output = :replace_selection
  cmd.input = :selection, :document
  cmd.invoke do 
    $stdin.readlines.sort {|a,b| a.downcase <=> b.downcase }.uniq.join("")
  end
end
