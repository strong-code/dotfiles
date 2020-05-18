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
    "Ruby and rbenv" => Proc.new { install_ruby },
    "Bash config" => Proc.new { install_bash },
    "NVM" => Proc.new { install_nvm },
    "GVM" => Proc.new { install_gvm },
    "Homebrew config" => Proc.new { install_homebrew },
    "OSX sytem config" => Proc.new { install_osx },
    "Git config" => Proc.new { install_git },
    "SSH config" => Proc.new { install_ssh },
    "Vim" => Proc.new { install_vim },
    "Atom" => Proc.new { install_atom },
    "Secrets file" => Proc.new { install_credentials },
    "Tmux" => Proc.new { install_tmux }
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
    exec(". ~/.bash_profile")
  rescue => e
    puts "Something went wrong with installing!"
    p e
  end
end

private

def install_tmux
  puts "Installing tmux..."
  if osx?
    system("brew install tmux")
  else
    system("apt-get install tmux -y")
  end

  puts "Linking tmux config..."
  make_symlink("tmux/", "~/.tmux")
  puts "Done"
end

def install_fonts
  if (!osx?)
    puts "Not on OSX, skipping"
    return
  end

  puts "Installing San Francisco font..."
  system("unzip ./fonts/SanFrancisco.zip -d /Library/Fonts/")
  puts "Installing Mononoki font..."
  system("unzip ./fonts/mononoki.zip -d /Library/Fonts/")
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
  system("mv ~/.bash_profile ~/.bash_profile_backup")
  make_symlink(".bash_profile", "~/.bash_profile")
  system(". ~/.bash_profile")
  puts "Done!"
end

def install_homebrew
  if (!osx?)
    puts "Not on OSX, skipping"
    return
  end

  puts "Running brew.sh for Homebrew install and app setup..."
  # Install homebrew
  shell_out("ruby -e \"$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)\"")
  # Run homebrew bash script
  shell_out("chmod +x ./homebrew/brew.sh && bash ./homebrew/brew.sh")
  puts "Done!"
end

def install_osx
  if (!osx?)
    puts "Not on OSX, skipping"
    return
  end

  shell_out("chmod +x osx/.osx && sh osx/.osx")
  make_symlink("osx/.hushlogin", "~/.hushlogin")
  puts "Done!"
end

def install_git
  make_symlink("git/.gitconfig", "~/.gitconfig")
  make_symlink("git/.gitignore", "~/.gitignore")
  make_symlink("git/.git-prompt.sh", "~/.git-prompt.sh")
  system("git config --global core.excludesfile ~/.gitignore")
  puts "Done!"
end

def install_ssh
  system("mkdir ~/.ssh") unless Dir.exist?(File.expand_path("~/.ssh"))
  make_symlink("ssh/config", "~/.ssh/config")
  system("chmod 600 ~/.ssh/config")
  puts "Done!"
end

def install_nvm
  shell_out("curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.1/install.sh | bash")
  shell_out(". ~/.bash_profile && nvm install 6 && nvm alias default node")
  puts "Done!"
end

def install_vim
  make_symlink("vim/.vimrc", "~/.vimrc")
  system("mkdir -p ~/.vim/colors/") unless Dir.exist?(File.expand_path("~/.vim/colors/"))
  make_symlink("vim/.nord.vim", "~/.vim/colors/nord.vim")
  puts "Done!"
end

def install_gvm
  shell_out("bash < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)")
  puts "Done!"
end

def install_atom
 make_symlink("atom", "~/.atom", true)
 puts "Done!"
end

def install_credentials
  system("cp .example.chl ~/.chl")
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

def make_symlink(source, target, force = false)
  source = File.expand_path(source)
  puts "Linking #{target} -> #{source}"
  if force
    system("ln -sf #{source} #{target}")
  else
    system("ln -s #{source} #{target}")
  end
end

def should_install?(section_name)
  puts "Install #{section_name}? [y] or [n]"
  STDIN.gets.chomp == 'y'
end

def osx?
  (/darwin/ =~ RUBY_PLATFORM) != nil
end

def success_message
  puts "Installation complete! Please restart your terminal for changes to take effect."
  puts "1. Remember to add ssh keys to your server, github and other services as needed"
  puts "2. Remember to import Terminal settings (located in osx/chl.terminal)"
  puts "3. Remember to add credential values to ~/.chl"
end
