if [nil, "-h", "--help"].include?(ARGV.first)
  ARGV.shift
  require 'grape_bootstrap/commands/help'
else
  require 'grape_bootstrap/commands/application'
end
