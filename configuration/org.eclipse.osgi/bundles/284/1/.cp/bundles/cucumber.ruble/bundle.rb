require 'ruble'

bundle do |bundle|
  bundle.author = 'Christopher Williams'
  bundle.copyright = "Copyright 2010 Aptana Inc. Distributed under the MIT license."
  bundle.display_name = 'Cucumber'
  bundle.description = "Cucumber RadRails bundle, ported from Ben Mabey's Cucumber TextMate bundle: http://github.com/bmabey/cucumber-tmbundle"
  bundle.repository = "git://github.com/aptana/cucumber.ruble.git"
  
  start_folding = /^\s*\b(Cenário|Cenario|Escenari|Escenario|Forgatókönyv|MISHUN|Mate|Scenarie|Scenarijus|Scenario|Scenariu|Scenariusz|Scenár|Scenārijs|Scénario|Scénář|Skenario|Stsenaarium|Szenario|Tapaus|Tình huống|Kịch bản|Сценарий|תרחיש|سيناريو|シナリオ|场景|場景|劇本|시나리오)/
  end_folding = /^\s*$/
  bundle.folding['text.cucumber.feature'] = start_folding, end_folding
  bundle.file_types['text.cucumber.feature'] = '*.feature'
  bundle.file_types['source.ruby.rspec.cucumber.steps'] = '*steps.rb'

  bundle.menu 'Cucumber' do |main_menu|
    main_menu.command 'Feature'
    main_menu.command 'Scenario'
    main_menu.command 'Scenario (heading only)'
    main_menu.command 'Scenario Outline'
    main_menu.command 'Given Step'
    main_menu.command 'When Step'
    main_menu.command 'Then Step'
    main_menu.command 'Cucumber Multiline Steps'
    main_menu.command 'Then Step Plaintext'
    main_menu.command 'When Step Plaintext'
    main_menu.command 'Autocomplete Step'
    main_menu.command 'Create All Undefined Steps'
    main_menu.command 'Choose Alternate File'
    main_menu.command 'Goto Alternate File'
    main_menu.command 'Goto Current Step'
    main_menu.command 'Run Feature'
    main_menu.command 'Run Single Scenario'
    main_menu.command 'Autoformat Feature (using Cucumber)'
    main_menu.command 'Align Table Cells'
  end
end

# Extend Ruble::Editor to add special ENV vars
env "text.cucumber.feature" do |e|
  e['TM_COMMENT_START'] = "# "
  e.delete('TM_COMMENT_END')
  e['TM_COMMENT_START_2'] = "=begin"
  e['TM_COMMENT_END_2'] = "=end"
  e.delete('TM_COMMENT_DISABLE_INDENT')
end
