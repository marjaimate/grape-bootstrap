require 'grape_bootstrap/commands/base'
require 'active_support/core_ext'

module GrapeBootstrap
  module Commands
    class Generate < Base
      alias_method :model, :render_template
      alias_method :api, :render_template

      def initialize path, type, options=[]
        super path, options
        if type.nil?
          throw "Type not specified"
        end
        @type = type
        @name = options.shift

        if @name.nil?
          throw "#{@type} needs a name to be generated"
        end

        self.send @type.downcase, @name
      end

      def render_template name
        template_type = @type
        erb_binding = -> {
          name = name.camelize
          binding
        }
        
        template_path = [
                          File.dirname(__FILE__), 
                          "..", 
                          "templates",
                          "app",
                          template_type.pluralize,
                          "new.rb.erb"
                        ].join('/')
        tpl = ERB.new(File.read(template_path))
        target_path = "app/#{template_type.pluralize}/#{name.underscore}.rb"

        File.open("#{@path}/#{target_path}", 'w') do |file|
          file << tpl.result(erb_binding.call)
        end
      end
    end
  end
end
