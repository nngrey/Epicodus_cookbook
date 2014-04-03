Cookbook::Application.routes.draw do
 match('contributors', {:via => :get, :to => 'contributors#index'})
 match('contributors/new', {:via => :get, :to => 'contributors#new'})
 match('contributors', {:via => :post, :to => 'contributors#create'})
 match('contributors/:id', {:via => :get, :to => 'contributors#show'})
 match('contributors/:id/edit', {:via => :get, :to => 'contributors#edit'})
 match('contributors/:id', {:via => [:patch, :put], :to => 'contributors#update'})
 match('contributors/:id', {:via => :delete, :to => 'contributors#destroy'})
end
