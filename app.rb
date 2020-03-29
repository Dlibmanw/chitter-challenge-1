require 'sinatra/base'
require './lib/peep.rb'

class Chitter < Sinatra::Base

  get '/' do
    'Chitter home page'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps' do
    Peep.create(text: params['text'])
    redirect '/peeps'
  end
  
  enable :sessions, :method_override

  delete '/peeps/:id' do
    Peep.delete(id: params['id'])
    redirect '/peeps'
  end

  get '/peeps/:id/edit' do
    @peep = Peep.find(id: params[:id])
    erb :'peeps/edit'
  end

  patch '/peeps/:id' do
    Peep.update(id: params['id'], text: params['text'])
    redirect('/peeps')
  end

  run! if app_file == $0
end
