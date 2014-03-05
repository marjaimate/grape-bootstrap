class API::Base < Grape::API
  def self.inherited(subclass)
    super
    subclass.instance_eval do
      version 'v1', :using => :path
      format :json

      rescue_from ActiveRecord::RecordNotFound do |e|
        message = e.message.gsub(/\s*\[.*\Z/, '')
          Rack::Response.new(
            [{ status: 404, status_code: "not_found", error: message }.to_json],
            404,
            { 'Content-Type' => 'application/json' }
          )
      end

      rescue_from ActiveRecord::RecordInvalid do |e|
        record = e.record
        message = e.message.downcase.capitalize
        Rack::Response.new(
          [{ status: 403, status_code: "record_invalid", error: message }.to_json],
          403,
          { 'Content-Type' => 'application/json' }
        )
      end
    end
  end

  default_format :json
end
