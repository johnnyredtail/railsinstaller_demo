require 'ruble.rb'

bundle 'Engine Yard' do |bundle|
  bundle.authoer = 'Allen Yeung'
  bundle.copyright = <<END
Copyright 2010 Aptana Inc. Distributed under the MIT license.
END

  bundle.repository = "git://github.com/aptana/engineyard.ruble.git"
  bundle.description = <<END
Easy deployment with Engine Yard from within Studio 3
END
  
  #bundle.repository = "git://github.com/aptana/engine-yard.ruble.git"
  

  bundle.menu "Engine Yard" do |menu|
    menu.scope = [ "source.ruby", "project.rails" ]
    
    menu.command "Deploy App"
    menu.separator
    menu.command "Open SSH Session"
    
    menu.menu "Deployment" do |deploy|
      deploy.command "List Environments"
      deploy.command "Retrieve Logs"
      deploy.command "Rebuild Environment"
      deploy.command "Rollback App"
    end
    menu.menu "Recipes" do |recipe|
      recipe.command "Apply Recipes"
      recipe.command "Upload Recipes"
      #recipe.command "Download Recipe"
    end
    menu.menu "Maintenance" do |web|
      web.command "Turn Maintenance On"
      web.command "Turn Maintenance Off"
    end
    
  end
  
end

