require 'ruble'

bundle do |bundle|
  bundle.author = 'Benjamin Jackson'
  bundle.contact_email_rot_13 = 'ora@vapbzhzqrfvta.pbz'
  bundle.display_name = "YAML"
  bundle.repository = "git://github.com/aptana/yaml.ruble.git"
  bundle.description =  <<END
<a href="http://www.yaml.org/">YAML</a> is a straightforward machine parsable data serialization format designed for human readability and interaction with scripting languages such as Perl and Python.
END
  increase_indent = /^\s*.*(:|-) ?(&\w+)?(\{[^}"']*|\([^)"']*)?$/
  decrease_indent = /^\s+\}$/
  bundle.indent['source.yaml'] = increase_indent, decrease_indent

  # Set up folding. Folding is now done in Java code for this language  
  # start_folding = /^[^#]\s*.*:(\s*\[?| &.+)?$/
  # end_folding = /^\s*$|^\s*\}|^\s*\]|^\s*\)/
  # bundle.folding['source.yaml'] = start_folding, end_folding

  bundle.menu 'YAML' do |main_menu|
    main_menu.command 'key: value'
    main_menu.command 'Add list item'
    main_menu.separator
    main_menu.command 'Sort Keys Alphabetically'
    main_menu.command 'Convert Document / Selection to Ruby'
    main_menu.separator
    main_menu.command 'Syntax Cheat Sheet'
  end
end

# Special ENV vars
env "source.yaml" do |e|
  e['TM_COMMENT_START'] = "# "
  e.delete('TM_COMMENT_END')
  e.delete('TM_COMMENT_START_2')
  e.delete('TM_COMMENT_END_2')
  e.delete('TM_COMMENT_DISABLE_INDENT')
end