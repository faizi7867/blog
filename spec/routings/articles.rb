require 'rails_helper'
RSpec.describe ArticlesController, type: :routing do
  describe 'routing' do

    it 'routes to #index' do
      expect(:get => '/articles').to route_to( :controller => 'articles',:action => 'index' )
    end
  
    it 'routes to #new' do
      expect(:get => '/articles/new').to route_to( :controller => 'articles', :action => 'new' )
    end

    it 'routes to #show' do
      expect(:get => '/articles/1').to route_to( :controller => 'articles', :action => 'show', :id=> '1' )
    end

    it 'routes to #create' do
      expect(:post => '/articles').to route_to( :controller => 'articles', :action => 'create' )
    end
    
    it 'routes to #edit' do
      expect(:get => '/articles/1/edit').to route_to( :controller => 'articles', :action => 'edit', :id => '1' )
    end 

    it 'routes to #update' do
      expect(:patch => '/articles/1').to route_to( :controller => 'articles', :action => 'update', :id => '1' )
    end 

    it 'routes to #update' do
      expect(:patch => '/articles/1').to route_to( :controller => 'articles', :action => 'update', :id => '1' )
    end 

    it 'routes to #destroy' do
      expect(:delete => '/articles/1').to route_to( :controller => 'articles', :action => 'destroy', :id => '1' )
    end

  end
end