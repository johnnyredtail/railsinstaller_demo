require 'java'
require 'ruble'
require 'ruble/platform'

bundle do |bundle|
  bundle.author = 'Christopher Williams'
  bundle.copyright = "Copyright 2010 Aptana Inc. Distributed under the MIT license."
  bundle.display_name =  'Text'
  bundle.description =  <<END
A port of the TextMate bundle.

The text bundle has a lot of support for plain text and is a requisite for working with text.
END
  bundle.repository = "git://github.com/aptana/text.ruble.git"
   
  bundle.menu 'Text' do |main_menu|
    main_menu.menu 'Font' do |font_menu|
      font_menu.command 'Bigger'
      font_menu.command 'Smaller'
    end
    main_menu.menu 'Converting / Stripping' do |submenu|
      submenu.command 'Convert Character / Selection to Hex'
      submenu.command 'Remove Trailing Spaces in Document / Selection'
      submenu.command 'Remove Unprintable Characters in Document / Selection'
      submenu.command 'Transliterate Word / Selection to ASCII'
    end
    main_menu.menu 'Encryption' do |submenu|
      submenu.command 'AES Encrypt Document / Selection With Password...'
      submenu.command 'AES Decrypt Document / Selection With Password...'
    end
    main_menu.menu 'Filtering' do |submenu|
      submenu.command 'Distill Document / Selection'
      submenu.command 'Copy Matching Lines into New Document'
      submenu.command 'Copy Non-Matching Lines into New Document'
    end
    main_menu.menu 'Sorting' do |submenu|
      submenu.command 'Sort Lines in Document / Selection'
      submenu.command 'Sort Lines & Remove Duplicates'
      submenu.separator
      submenu.command 'Randomize Lines in Document / Selection'
    end
    main_menu.separator
    main_menu.command 'Delete to Beginning of Line'
    main_menu.command 'Duplicate Line / Selection'
    main_menu.command 'Join Lines'
    main_menu.separator
    main_menu.command "Execute Selection/Line Inserting Results"
    main_menu.separator
    main_menu.command 'Add Line Numbers to Document / Selection'
    main_menu.command 'Statistics for Document / Selection (Word Count)'
    main_menu.separator
    main_menu.command 'Copyright Notice'
    main_menu.command 'Current Date - YYYY-MM-DD'
    main_menu.command 'Lorem ipsum'
    main_menu.command 'Speak Document / Selection' unless Ruble.is_windows?
  end
end

# Default set of character pairs
smart_typing_pairs[""] = ['"', '"', '(', ')', '{', '}', '[', ']']
