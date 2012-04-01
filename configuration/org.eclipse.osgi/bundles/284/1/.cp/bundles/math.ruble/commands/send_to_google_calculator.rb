require 'ruble'

command 'Send Line / Selection to Google Calculator' do |cmd|
  cmd.key_binding = 'CONTROL+M2+C'
  cmd.output = :replace_selection
  cmd.input = :selection, :line
  cmd.invoke do
    require 'cgi'
    query = CGI::escape(STDIN.read)
    context.exit_discard if query.empty?
      
    require 'net/http'    
    response = Net::HTTP.get('www.google.com', '/search?q=' + query)
    if response =~ /<b>.*? = (.*?)<\/b>/
      answer = $1
      answer.gsub!(/<sup>(.+?)<\/sup>/, '^\1') # Prefix exponents
      answer.gsub!(/<.+?>/, '')
      answer.gsub!('&#215;', '?')
      answer.gsub!(/(\d+) (?=\d{3})/, '\1,') # Turn 10 000 into 10,000
      print answer
    else
      context.exit_show_tool_tip 'Invalid calculation'
    end
  end
end
