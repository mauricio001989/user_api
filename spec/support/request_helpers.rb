module RequestHelpers
  def json_response
    JSON.parse(response.body)
  end
end

RSpec.configure do |config|
  config.include RequestHelpers, type: :request
  config.include RequestHelpers, type: :controller
end
