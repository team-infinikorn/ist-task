module GenericHelper
  def check_valid?(object, attr, value, error_message)
    object[attr] = value
    expect(object.save).to be_falsey
    expect(object.errors.full_messages).to eq(error_message)
  end
end

RSpec.configure do |config|
  config.include GenericHelper
end
