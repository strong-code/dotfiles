require 'rake'
require 'open3'

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
  path = File.expand_path("~/.gemrc")
  `ln -s ./ruby/.gemrc #{path}`
  puts "Done!"
end

def install_bash
  puts "Backing up contents of ~/.bash_profile..."
  `mv ~/.bash_profile ~/.bash_profile_backup`
  puts "Done! Symlinking .bash_profile..."
  path = File.expand_path("~/.bash_profile")
  `ln -s .bash_profile #{path}`
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
  path = File.expand_path("~/.osx")
  `ln -s osx/.osx #{path}`
  puts "Done!"
end

def install_git
  puts "Symlinking git configuration"
  # Symlink .gitconfig for user-specific settings
  path = File.expand_path("~/.gitconfig")
  `ln -s git/.gitconfig #{path}`
  # Symlink global .gitignore
  path = File.expand_path("~/.gitignore")
  `ln -s git/.gitignore #{path}`
  `git config --global core.excludesfile ~/.gitignore`
  puts "Done!"
end

def install_ssh
  puts "Symlinking ssh configuration..."
  # Symlink ssh .config
  path = File.expand_path("~/.ssh/config")
  `mkdir ~/.ssh`
  `ln -s ssh/.config #{path}`
  puts "Done!"
end

def install_irssi
  puts "Symlinking irssi configuration..."
  # Irssi MUST be installed first (through brew.sh)
  path = File.expand_path("~/.irssi/config")
  `mkdir ~/.irssi`
  `ln -s irssi/config #{path}`
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
  if ['-v', '-verbose'].include?(ARGV[0])
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
