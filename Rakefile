require 'rake'
require 'open3'

task :install, [:all] do |_, args|
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
    "Irssi config" => Proc.new { install_irssi },
    "NVM" => Proc.new { install_nvm },
    "Vim" => Proc.new { install_vim }
  }

  begin
    if (args[:all])
      modules.each{ |k,v| puts "Installing module: #{k}"; v.call }
    else
      modules
      .select { |k,_| should_install?(k) }
      .each { |k,v| puts "Installing module: #{k}"; v.call }
    end

    success_message
  rescue => e
    puts "Something went wrong with installing!"
    p e
  end
end

private

def install_fonts
  if (!osx?) then puts "Not on OSX, skipping"; return

  puts "Installing San Francisco font..."
  bash("unzip ./fonts/SanFrancisco.zip -d /Library/Fonts/")
  puts "Installing Mononoki font..."
  bash("unzip ./fonts/mononoki.zip -d /Library/Fonts/")
  puts "Done!"
end

def install_ruby
  puts "Installing rbenv..."
  # Run RVM setup
  shell_out("git clone https://github.com/rbenv/rbenv.git ~/.rbenv")
  shell_out("echo export PATH=\"$HOME/.rbenv/bin:$PATH\"' >> ~/.bash_profile")
  shell_out("~/.rbenv/bin/rbenv init")

  make_symlink("ruby/.gemrc", "~/.gemrc")
  puts "Done!"
end

def install_bash
  puts "Backing up contents of ~/.bash_profile..."
  `mv ~/.bash_profile ~/.bash_profile_backup`
  make_symlink(".bash_profile", "~/.bash_profile")
  bash("source ~/.bash_profile")
  puts "Done!"
end

def install_homebrew
  if (!osx?) then puts "Not on OSX, skipping"; return

  puts "Running brew.sh for Homebrew install and app setup..."
  # Install homebrew
  shell_out("ruby -e \"$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)\"")
  # Run homebrew bash script
  shell_out("chmod +x ./homebrew/brew.sh && bash ./homebrew/brew.sh")
  puts "Done!"
end

def install_osx
  if (!osx?) then puts "Not on OSX, skipping"; return

  shell_out("chmod +x osx/.osx && sh osx/.osx")
  make_symlink("osx/.hushlogin", "~/.hushlogin")
  puts "Done!"
end

def install_git
  make_symlink("git/.gitconfig", "~/.gitconfig")
  make_symlink("git/.gitignore", "~/.gitignore")
  make_symlink("git/.git-prompt.sh", "~/.git-prompt.sh")
  `git config --global core.excludesfile ~/.gitignore`
  puts "Done!"
end

def install_ssh
  `mkdir ~/.ssh` if !Dir.exist?(File.expand_path("~/.ssh"))
  make_symlink("ssh/.config", "~/.ssh/config")
  puts "Done!"
end

def install_irssi
  `mkdir -p ~/.irssi` if !Dir.exist?(File.expand_path("~/.irssi"))
  make_symlink("irssi/config", "~/.irssi/config")
  puts "Done!"
end

def install_nvm
  `curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.1/install.sh | bash`
  bash("source ~/.bash_profile")
  bash("nvm install 6")
  bash("nvm use 6")
  puts "Done!"
end

def install_vim
  make_symlink("vim/.vimrc", "~/.vimrc")
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

def make_symlink(source, target)
  source = File.expand_path(source)
  puts "Linking #{target} -> #{source}"
  shell_out("ln -s #{source} #{target}")
end

def should_install?(section_name)
  puts "Install #{section_name}? [y] or [n]"
  STDIN.gets.chomp == 'y'
end

def bash(command)
  require 'shellwords'
  escaped_command = Shellwords.escape(command)
  `bash -c #{escaped_command}`
end

def osx?
  (/darwin/ =~ RUBY_PLATFORM) != nil
end

def success_message
  puts "Installation complete! Please restart your terminal for changes to take effect."
  puts "1. Remember to add ssh keys to your server, github and other services as needed"
  puts "2. Remember to import Terminal settings (located in osx/chl.terminal)"
  puts "3. Remember to re-import Atom packages, styles.less and config.cson files"
end
