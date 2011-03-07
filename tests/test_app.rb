ENV['RACK_ENV'] = 'test'

require 'test/unit'
require 'rack/test'
require 'nokogiri'

app_dir = File.expand_path('../' + File.dirname(__FILE__))
require app_dir + '/app'
require app_dir + '/tests/test_unit_ext'


class AppTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  must "return status 200" do
    get '/'
    assert last_response.ok?
    assert_equal 200, last_response.status
  end

  must "have a title" do
    get '/'
    @html = Nokogiri::XML(last_response.body)
    assert_equal 'test', @html.at('title').text
  end

end
