require 'grape_bootstrap/commands/base'
require 'active_support/core_ext'

module GrapeBootstrap
  module Commands
    class Generate < Base
      def initialize path, type, options=[]
        super path, options
        if type.nil?
          throw "Type not specified"
        end
        @type = type

        self.send type.downcase, options.shift
      end

      def model name
        if name.nil?
          throw "Model needs a name to be generated"
        end

        render_template name
      end

      private
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
