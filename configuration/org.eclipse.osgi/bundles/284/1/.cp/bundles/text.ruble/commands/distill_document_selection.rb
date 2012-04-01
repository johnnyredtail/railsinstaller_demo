require 'ruble'

command 'Distill Document / Selection' do |cmd|
  cmd.output = :replace_selection
  cmd.input = :document
  cmd.invoke do |context|
    res = Ruble::UI.request_string(:title => 'Distill Text', :prompt => 'Enter a pattern:', :button1 => 'Filter', :button2 => 'Cancel')
    context.exit_discard unless res
    res = res.to_s    
    # FIXME Not sure, but looks like the original command sent matching lines to a new file, and replaced existing doc with non-matching...
    $stdin.readlines.each {|line| puts line if line.match(res) }
    nil
  end
end
