require 'grape_bootstrap/commands/base'
require 'fileutils'
require 'erb'

module GrapeBootstrap
  module Commands
    class AppInit < Base
      def initialize path, options=[]
        super path, options
        @dry = (options & ["--dry"]).length > 0

        setup_dirs
        setup_base_files
      end

      private
      def setup_dirs
        {
          "app/api" => ["base.rb", "status.rb"],
          "app/helpers" => [],
          "app/models" => [],
          "config" => ["database.yml"],
          "config/environments" => ["development.rb"],
          "db/migrate" => [],
          "lib" => [],
          "docs" => [],
          "public" => ["index.html"]
        }.each do |dir, files|
          puts "Creating #{dir}"
          FileUtils.mkdir_p("#{@path}/#{dir}")  unless @dry

          files.each do |f|
            puts "Creating #{dir}/#{f}"
            file_from_template(f, dir)  unless @dry
          end
        end
      end

      def setup_base_files
        [
          "Gemfile",
          "README.md",
          "application.rb",
          "environment.rb",
          "config.ru",
          "Rakefile"
        ].each do |filename|
          puts "Creating #{filename}"
          file_from_template(filename)  unless @dry
        end
      end

      def file_from_template template_name, sub_path=nil
          erb_binding = -> {
            app_name = "APP"
            binding
          }
          
          template_name = "#{sub_path}/#{template_name}"  if sub_path
          tpl = ERB.new(
                  File.read(
                    "#{File.dirname(__FILE__)}/../templates/#{template_name}.erb"
                  )
                )

          File.open("#{@path}/#{template_name}", 'w') do |file|
            file << tpl.result(erb_binding.call)
          end
      end
    end
  end
end
