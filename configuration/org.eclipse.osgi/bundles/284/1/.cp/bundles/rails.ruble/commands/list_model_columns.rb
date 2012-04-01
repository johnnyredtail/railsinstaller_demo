require 'ruble'

command "List Columns of a Model" do |cmd|
  cmd.key_binding = "M3+SPACE"
  cmd.scope = "source.ruby.rails, text.html.ruby, text.haml"
  cmd.input = :selection, :word
  cmd.trigger = "."
  cmd.output = :insert_as_text
  cmd.invoke do |context|
    require 'list_columns'
    
    # begin
      context.exit_show_tool_tip("Place cursor on class name (or variation) to show its schema") if word.nil? || word.empty?
      
      # Check if Rails is installed.
      unless rails_present?
        message = "You don't have Rails installed in this gemset."
        
        if File.exists?("#{Ruble.project_directory}/.rvmrc") && 
          if rvm = File.open("#{Ruble.project_directory}/.rvmrc").read
            message += " (#{rvm.sub('rvm use', '').strip})"
          end
        end
        
        context.exit_show_tool_tip(message)
      end
      
      klass = Inflector.singularize(Inflector.underscore(word))
  
      if cache[klass]
        display_menu(klass)
      elsif cache[klass_without_undescore = klass.split('_').last]
        display_menu(klass_without_undescore)
      else
        options = [
          @error || "'#{Inflector.camelize(klass)}' is not an Active Record derived class or was not recognised as a class.", 
          LINE,
          cache.keys.map { |model_name| "Use #{Inflector.camelize(model_name)}..." },
          LINE,
          RELOAD_MESSAGE
        ].flatten
        selected = Ruble::UI.menu(options)
        
        return if selected.nil?
  
        case options[selected]
        when options.first
          if @error && @error =~ /^#{Ruble.project_directory}(.+?)[:]?(\d+)/
            Ruble.open(File.join(Ruble.project_directory, $1), $2.to_i)
          else
            klass_file = File.join(Ruble.project_directory, "/app/models/#{klass}.rb")
            Ruble.open(klass_file) if File.exist?(klass_file)
          end
        when RELOAD_MESSAGE
          load_and_cache_all_models
          show_options
        else
          klass = Inflector.singularize(Inflector.underscore(options[selected].split[1].delete('...')))
          clone_cache(klass, word)
          display_menu(word)
        end
      end
      nil
    # rescue Exception => e
    #   context.exit_show_tool_tip(e.message)
    # end
  end
end