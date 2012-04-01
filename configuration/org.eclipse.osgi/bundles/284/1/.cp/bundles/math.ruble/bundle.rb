require 'java'
require 'ruble'

bundle do |bundle|
  bundle.author = 'Christopher Williams'
  bundle.copyright = "Copyright 2010 Aptana Inc. Distributed under the MIT license."
  bundle.display_name =  'Math'
  bundle.description = "Support for performing different calculations, ported from TextMate."
  bundle.repository = "git://github.com/aptana/math.ruble.git"
  
  bundle.menu 'Math' do |main_menu|
    main_menu.command 'Evaluate Line / Selection'
    main_menu.command 'Evaluate and Replace Expression'
    main_menu.command 'Evaluate and Replace Expression (rounded)'
    main_menu.separator
    main_menu.command 'Add Numbers in Line / Selection'
    main_menu.command 'Subtract Numbers in Line / Selection'
    main_menu.separator
    main_menu.menu 'Convert' do |submenu|
      submenu.command 'Decimal to Hex'
      submenu.command 'Decimal to Octal'
      submenu.command 'Hex to Decimal'
      submenu.command 'Octal to Decimal'
    end
    main_menu.separator
    main_menu.command 'Send Line / Selection to Google Calculator'
  end
end
