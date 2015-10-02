require 'rake'
require 'envyable'
require 'open3'

# Load env variables from our install profile
Envyable.load('./env.yml', 'install')

task :install do
  puts
  puts "======================================================"
  puts "Welcome to your dotfile installation!"
  puts "======================================================"
  puts

  begin
    install_fonts if should_install?("San Francisco font")
    install_ruby if should_install?("ruby and rvm configuration")
    install_bash if should_install?("bash profile")
    install_homebrew if should_install?("Homebrew & default apps")
    install_osx if should_install?("OSX system settings")
    install_git if should_install?("git configuration")
    install_ssh if should_install?("ssh configuration")
    install_irssi if should_install?("irssi config")
    success_message
  rescue => e
    puts "Something went wrong with installing!"
    puts e
  end
end

private

def install_fonts
  puts "Installing San Francisco font..."
  shell_out("ruby -e \"$(curl -fsSL https://raw.github.com/supermarin/YosemiteSanFranciscoFont/master/install)\"")
  puts "Done!"
end

def install_ruby
  puts "Installing RVM..."
  # Run RVM setup
  shell_out("bash ./ruby/setup.sh")
  # Symlink .gemrc file
  `ln -s ./ruby/.gemrc ~/.gemrc`
  puts "Done!"
end

def install_bash
  puts "Symlinking .bash_profile..."
  `ln -s ./.bash_profile ~/.bash_profile`
  puts "Done!"
end

def install_homebrew
  puts "Running brew.sh for Homebrew install and app setup..."
  # Install homebrew
  shell_out("ruby -e \"$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)\"")
  # Run homebrew bash script
  shell_out("bash ./homebrew/brew.sh")
  puts "Done!"
end

def install_osx
  puts "Symlinking .osx configuration..."
  # Symlink .osx file
  `ln -s ./osx/.osx ~/.osx`
  puts "Done!"
end

def install_git
  puts "Symlinking git configuration"
  # Symlink .gitconfig for user-specific settings
  `ln -s ./git/.gitconfig ~/.gitconfig`
  # Symlink global .gitignore
  `ln -s ./git/.gitignore ~/.gitignore`
  `git config --global core.excludesfile ~/.gitignore`
  puts "Done!"
end

def install_ssh
  puts "Symlinking ssh configuration..."
  # Symlink ssh .config
  `ln -s ./ssh/.config ~/.ssh/config`
  puts "Done!"
end

def install_irssi
  puts "Symlinking irssi configuration..."
  # Irssi MUST be installed first (through brew.sh)
  `ln -s ./irssi/config ~/.irssi/config`
  puts "Done!"
end

# Shell out to interactive prompt for shell installations
def shell_out(command)
  puts "Entering bash prompt..."
  i, o, c = Open3.popen2("#{command}")
  Thread.new {
    while c = gets
      i.puts
    end
    i.close
  }
  puts c while c = o.gets
  puts "Finished. Back to Rakefile!"
end

def should_install?(section_name)
  if ENV['VERBOSE'] == 'true'
    puts "Run install script for: #{section_name}? [y]es, [n]o"
    STDIN.gets.chomp == 'y'
  else
    true
  end
end

def success_message
  puts "Installation complete! Please restart your terminal for changes to take effect."
  puts "Also remember to add NickServ auth command to your irssi config file! (found in /irssi/config)"
end
