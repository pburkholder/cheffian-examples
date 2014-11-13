# Encoding: utf-8

task default: [:cop, :foodcritic, :spec]

task all: [:default, :kitchen]

desc 'Run ChefSpec unit tests'
task :spec do
  sh('rspec', '--format', 'documentation', 'test/unit')
end

desc 'Run RuboCop'
task :cop do
  sh('rubocop')
end

desc 'Run Foodcritic'
task :foodcritic do
  sh('foodcritic', '-f', 'any', '.')
end

desc 'Run KitchenCI'
task :kitchen do
  sh('kitchen', 'converge', 'centos-6')
  sh('kitchen', 'verify', 'centos-6')
end
