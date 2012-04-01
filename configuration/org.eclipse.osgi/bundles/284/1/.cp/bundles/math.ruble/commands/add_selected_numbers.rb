require 'ruble'

command 'Add Numbers in Line / Selection' do |cmd|
  cmd.key_binding = 'CONTROL+M2+C'
  cmd.output = :insert_as_text
  cmd.input = :selection, :line
  cmd.invoke do
    print " = " + $stdin.read.gsub(/[$ۣ]/, '').scan(/((?:\b|-)[0-9]+(?:\.[0-9]+)?)\b/).inject(0.0) { |t,s| t + s[0].to_f() }.to_s.sub(/.0+\z/, '')
  end
end
