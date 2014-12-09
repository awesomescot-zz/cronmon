require 'sinatra'
require 'open4'
require 'redis'
require 'json'

class Base < Sinatra::Base

  set :public_folder, File.dirname(__FILE__) + '/static'
  set :views, settings.root + '/templates'
   
  redis = Redis.new
  
  
  get '/' do
    #"#{job.last_work_time} hello"
    erb :index, :locals => {:redis => redis }
  end
end

