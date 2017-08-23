ENV["RACK_ENV"] ||= "development"

require 'sinatra'
require_relative './models/link'
require 'sinatra/base'


class BookmarkManager < Sinatra::Base
  get'/links' do
    @links = Link.all
    erb :'links/index'
  end

  get'/links/new' do
    erb :'links/new'
  end

  post'/links' do
    Link.create(
      :title => params[:title],
      :url => params[:url]
    )
    redirect '/links'
  end
end
