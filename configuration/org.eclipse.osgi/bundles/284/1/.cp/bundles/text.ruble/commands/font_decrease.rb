require 'ruble'

command 'Smaller' do |cmd|
  cmd.key_binding = 'M1+-'
  cmd.output = :discard
  cmd.input = :none
  cmd.invoke do |context|
    require 'font_size'
    increase_font(-1) # increase default text font
    increase_font(-1, "com.aptana.explorer.font") # increase font for our views (outline, app explorer)
  end
end


