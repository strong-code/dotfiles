require 'rake'
require 'open3'

task :install do
  puts
  puts "======================================================"
  puts "Welcome to your dotfile installation!"
  puts "======================================================"
  puts

  modules = {
    "System fonts" => Proc.new { install_fonts },
    "Ruby and RVM" => Proc.new { install_ruby },
    "Bash config" => Proc.new { install_bash },
    "Homebrew config" => Proc.new { install_homebrew },
    "OSX sytem config" => Proc.new { install_osx },
    "Git config" => Proc.new { install_git },
    "SSH config" => Proc.new { install_ssh },
    "Irssi config" => Proc.new { install_irssi }
  }

  begin
    modules
      .select! { |k,_| should_install?(k) }
      .each { |k,v| puts "Installing module: #{k}"; v.call }

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

  symlink("ruby/.gemrc", "~/.gemrc")
  puts "Done!"
end

def install_bash
  puts "Backing up contents of ~/.bash_profile..."
  `mv ~/.bash_profile ~/.bash_profile_backup`
  symlink(".bash_profile", "~/.bash_profile")
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
  symlink("osx/.osx", "~/.osx")
  puts "Done!"
end

def install_git
  symlink("git/.gitconfig", "~/.gitconfig")
  symlink("git/.gitignore", "~/.gitignore")
  `git config --global core.excludesfile ~/.gitignore`
  puts "Done!"
end

def install_ssh
  `mkdir ~/.ssh` if !Dir.exist?(File.expand_path("~/.ssh"))
  symlink("ssh/.config", "~/.ssh/config")
  puts "Done!"
end

def install_irssi
  # Irssi MUST be installed first (through brew.sh)
  symlink("irssi/config", "~/.irssi/config")
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

def symlink(source, target)
  target = File.expand_path(target)
  puts "Linking #{target} from #{source}"
  shell_out("ln -s \"$PWD/#{source}\" \"#{target}\"")
end

def should_install?(section_name)
  puts "Install #{section_name}? [y] or [n]"
  STDIN.gets.chomp == 'y'
end

def success_message
  puts "Installation complete! Please restart your terminal for changes to take effect."
  puts "Also remember to add NickServ auth command to your irssi config file! (found in /irssi/config)"
end
