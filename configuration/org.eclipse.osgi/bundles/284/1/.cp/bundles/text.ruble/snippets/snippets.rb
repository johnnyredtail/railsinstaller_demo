require 'ruble'

command 'Copyright Notice' do |s|
  s.trigger = 'c)'
  s.input = :none
  s.output = :insert_as_snippet
  s.invoke { "(c) Copyright #{Time.now.year} #{ENV['TM_FULLNAME']}. All Rights Reserved. " }
end

command 'Current Date - YYYY-MM-DD' do |s|
  s.trigger = 'isoD'
  s.input = :none
  s.output = :insert_as_snippet
  s.invoke { Time.now.strftime('%Y-%m-%d') }
end

snippet 'Lorem ipsum' do |s|
  s.trigger = 'lorem'
  s.expansion = 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'
end

