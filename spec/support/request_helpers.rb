module RequestHelpers
  def json_response
    JSON.parse(response.body)
  end

  def auth_headers_for(user)
    request.headers.merge! user.create_new_auth_token
  end
end

RSpec.configure do |config|
  config.include RequestHelpers, type: :request
  config.include RequestHelpers, type: :controller
end
