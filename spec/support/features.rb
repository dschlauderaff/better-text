RSpec.configure do |config|
  config.include Warden::Test::Helpers

  config.after :each do
    Warden.test_reset!
  end

  config.include Features::Helpers, type: :feature

end