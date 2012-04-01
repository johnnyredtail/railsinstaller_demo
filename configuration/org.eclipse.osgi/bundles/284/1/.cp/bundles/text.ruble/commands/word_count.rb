require 'ruble'

def pretty(number)
  number.to_s.gsub(/\d{1,3}(?=\d{3}+(?!\d))/, '\0,')
end
# FIXME Tooltip isn't showing properly when input is selection...
command 'Statistics for Document / Selection (Word Count)' do |cmd|
  cmd.key_binding = 'CONTROL+M2+N'
  cmd.output = :show_as_tooltip
  cmd.input = :selection, :document
  cmd.invoke do
    
   lines = words = bytes = 0
   
   loop do
    data = ($stdin.read(4096) or break) << ($stdin.gets || "")
    bytes += data.length
    lines += data.count("\n")
    ((data.strip! || data).gsub!(/[\n\r]/, " ") || data).squeeze!
    words += data.count(" ") + 1
   end

    counts = []
    
    counts << (lines +1)
    counts << words
    counts << bytes

    %w[ line word byte ].each do |unit|
      cnt    = counts.shift
      plural = cnt.to_i != 1 ? 's' : ''
      printf("%11.11s %s%s\n", pretty(cnt), unit, plural)
    end
    nil
  end
end
