# frozen_string_literal: true

RSpec.shared_examples 'validate response count' do |model, value|
  it "returns #{ value } #{ model }" do
    expect(json_response.size).to eq(value)
  end
end
