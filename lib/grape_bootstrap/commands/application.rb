require 'grape_bootstrap/commands/app_init'

if 'init' == ARGV.shift.downcase
  path = %x(pwd).gsub(/\n/, '')
  GrapeBootstrap::Commands::AppInit.new(path, ARGV)
else
  puts "Unknown command"
  exit 1
end
