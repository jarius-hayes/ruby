# frozen_string_literal: true

require File.expand_path("../endpoint", __FILE__)

Artifice.deactivate

class EndpointStrictBasicAuthentication < Endpoint
  before do
    unless env["HTTP_AUTHORIZATION"]
      halt 401, "Authentication info not supplied"
    end

    # Only accepts password == "password"
    unless env["HTTP_AUTHORIZATION"] == "Basic dXNlcjpwYXNz"
      halt 403, "Authentication failed"
    end
  end
end

Artifice.activate_with(EndpointStrictBasicAuthentication)
