require 'test_helper'

class LightTest < Minitest::Test
  def before_setup
    super

    stub_request(:get, "https://discovery.meethue.com/").
      to_return(:body => '[{"internalipaddress":"localhost"}]')

    stub_request(:get, %r{http://localhost/api/*}).to_return(:body => '[{"success":true}]')
    stub_request(:post, 'http://localhost/api').to_return(:body => '[{"success":{"username":"ruby"}}]')
    stub_request(:put, %r{http://localhost/api*}).to_return(:body => '[{}]')
  end

  %w{on hue saturation brightness color_temperature alert effect}.each do |attribute|
    define_method "test_setting_#{attribute}" do
      client = Hue::Client.new(use_mdns: false)
      light = Hue::Light.new(client, client.bridge, 0, {"state" => {}})

      light.send("#{attribute}=", 24)
      assert_requested :put, %r{http://localhost/api/.*/lights/0}
    end
  end
end
