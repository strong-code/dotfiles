require 'rake'
require 'envyable'

# Load env variables from our install profile
Envyable.load('./env.yml', 'install')

task :install do
  puts
  puts "======================================================"
  puts "Welcome to your dotfile installation!"
  puts "======================================================"
  puts

  install_ruby if should_install("ruby and rvm configuration")
  install_homebrew if should_install("Homebrew & default apps")
  install_osx if should_install("OSX system settings")
  install_git if should_install("git configuration")
  install_ssh if should_install("ssh configuration")
  install_irssi if should_install("irssi config")
end

private

def install_ruby
  # Run RVM setup
  `bash ./ruby/setup.sh`
  # Symlink .gemrc file
  `ln -s ./ruby/.gemrc ~/.gemrc`
end

def install_homebrew
  # Run homebrew bash script
  `bash ./homebrew/brew.sh`
end

def should_install?(section_name)
  if ENV['VERBOSE'] == 'true'
    puts "Run install script for: #{section_name}? [y]es, [n]o"
    STDIN.gets.chomp == 'y'
  else
    true
  end
end
