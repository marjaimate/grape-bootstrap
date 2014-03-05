require "grape_bootstrap/commands/app_init.rb"
require "grape_bootstrap/commands/generate.rb"

main_cmd = ARGV.shift.downcase
path = %x(pwd).gsub(/\n/, '')

case main_cmd
when 'init' 
  GrapeBootstrap::Commands::AppInit.new(path, ARGV)
when 'generate'
  GrapeBootstrap::Commands::Generate.new(path, ARGV.shift, ARGV)
else
  puts "Unknown command"
  exit 1
end
