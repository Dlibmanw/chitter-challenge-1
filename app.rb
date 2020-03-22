require 'sinatra/base'
require './lib/peep.rb'

class Chitter < Sinatra::Base
  get '/' do
    'Chitter home page'
  end

  get '/peeps' do
    p ENV
    @peeps = Peep.all
    erb :'peeps/index'
  end

  run! if app_file == $0
end
