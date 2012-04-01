require 'ruble'
require 'ruble/ui'
require 'ruble/terminal'
require 'rbconfig'

module EYCommand
  
  def self.is_windows?
    RbConfig::CONFIG['target_os'] =~ /(win|w)32$/
  end
  
  def self.is_gem_installed?(gem)
    if is_windows?
      `gem search #{gem}` =~ /#{Regexp.escape(gem)}/
    else
      `/bin/sh -l -c "gem search #{gem}"`=~ /#{Regexp.escape(gem)}/
    end
  end
  
  def self.run(command)
    command = "ey #{command}"
    unless is_gem_installed?("engineyard")
      if Ruble::UI.request_confirmation(
          :title => "Install Engine Yard gem?",
          :prompt => "The Engine Yard gem was not found on your system. Would you like to install the Engine Yard gem now?",
          :button1 => "Install Engine Yard gem")
        if is_windows?
          command = "gem install engineyard"
        else
          command = "sudo gem install engineyard"
        end
      else
        return false
      end
    end
    Ruble::Terminal.open(command)
  end
  
end


module EYPrompt
  
  def self.prompt(prompt)
    Ruble::UI.send(:request_string_core, prompt, false, {})
  end  

end