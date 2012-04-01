require 'ruble'

command 'Evaluate and Replace Expression' do |cmd|
  cmd.key_binding = 'CONTROL+M2+C'
  cmd.output = :replace_selection
  cmd.input = :selection, :line
  cmd.invoke do
    begin
      result = eval($stdin.read.gsub(/[$®£]/, '')).to_s
      result = "1" if result == "true"
      result = "0" if result == "false"
               
      result.gsub!(/[^\d\.]/, '')
      if result.nil? || result.empty?
        print "Invalid Expression"
      else
        print result
      end
    rescue Exception => e
      print "Invalid Expression"
    end
  end
#  cmd.invoke =<<-EOF
#printf "%s" `{ tr -d ,; echo; } | bc -l`| perl -pe 's/(\.[^0]+)0+$|\.0+$/$1/'
#EOF
end
