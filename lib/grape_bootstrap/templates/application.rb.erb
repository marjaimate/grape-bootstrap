require File.expand_path('../environment', __FILE__)

module API
end

require 'app/api/base'

Dir["#{File.dirname(__FILE__)}/app/models/extensions/**/*.rb"].each {|f| require f}
Dir["#{File.dirname(__FILE__)}/app/models/**/*.rb"].each {|f| require f}
Dir["#{File.dirname(__FILE__)}/app/**/*.rb"].each {|f| require f}

ActiveRecord::Base.instance_eval do
  include ActiveModel::MassAssignmentSecurity
  attr_accessible []
end


class API::Root < Grape::API
  format :json

  before do
    header['Access-Control-Allow-Origin'] = '*'
    header['Access-Control-Request-Method'] = '*'
  end

  mount API::Base
  mount API::Status
end

ApplicationServer = Rack::Builder.new {
  use Rack::Static, :urls => [
    "/css",
    "/images",
    "/lib"
  ], :root => "public", index: 'index.html'

  map "/" do
    run API::Root
  end
}
