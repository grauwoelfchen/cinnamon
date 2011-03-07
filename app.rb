require 'rubygems'
require 'sinatra'
require 'haml'
require 'sass'

configure :production do
  error do
    'Error'
  end

  not_found do
    'Not Found'
  end
end

configure :development do |c|
  require 'sinatra/reloader'
  c.also_reload '*.rb'

  after do
    p response.status
  end
end

helpers do
  # pass
end

before do
  # pass
end

get '/' do
  haml :index
end

get '/stylesheet.css' do
  sass :stylesheet, :style => :compact
end
