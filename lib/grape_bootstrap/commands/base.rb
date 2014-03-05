module GrapeBootstrap
  module Commands
    class Base
      attr_reader :path

      def initialize path, options=[]
        if path.nil?
          throw "Path not specified"
        end
        @path = path
      end
    end
  end
end
