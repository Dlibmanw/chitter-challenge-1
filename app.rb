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

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps' do
    p params
    p "Form data submitted to the /bookmarks route!"
    Peep.create(text: params['text'])
    redirect '/peeps'
  end
  
  enable :sessions, :method_override

  delete '/peeps/:id' do
    connection = PG.connect(dbname: 'chitter_peeps1_test')
    connection.exec("DELETE FROM peeps WHERE id = #{params['id']}")
    redirect '/peeps'
    #lets print out the form params
    p params
  end

  run! if app_file == $0
end
