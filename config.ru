require 'rubygems'
require 'sinatra'
use Rack::Lint

Sinatra::Base.set(:public, File.join(File.dirname(__FILE__), 'public'))
Sinatra::Base.set(:views,  File.join(File.dirname(__FILE__), 'views'))
Sinatra::Base.set(:run,    false)
Sinatra::Base.set(:env,    ENV['RACK_ENV'])

app_dir = File.expand_path(File.dirname(__FILE__))
require app_dir + '/app'

set :environment, :production
run Sinatra::Application
