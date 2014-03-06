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
        # Ugly hack for models vs api
        @type = 'model' == type ? 'models' : type
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
                          template_type,
                          "new.rb.erb"
                        ].join('/')
        tpl = ERB.new(File.read(template_path))
        target_path = "app/#{template_type}/#{name.underscore}.rb"

        File.open("#{@path}/#{target_path}", 'w+') do |file|
          file << tpl.result(erb_binding.call)
        end
      end

      alias_method :models, :render_template
      alias_method :api, :render_template
    end
  end
end
