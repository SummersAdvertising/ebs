Ebs::Application.routes.draw do
   
  
      #testimonials
      #testimony
  resources :testimonials, :controller => :reviews , :only => [ :index, :show]
  #resources :reviews, :only => [ :index, :show]
  resources :contacts, :only => [:index, :new, :create]
  
  namespace :admin do
  	
  	authenticated :user do
	  root :to => "admins#index"
	end

  	get '/' => 'admins#index'
  	
  	resources :admins
  	
  	resources :photos do
  		member do
  			post :resize
  		end
  	end
  	
  	resources :reviews do
    	member do
    		match :upload_cover, :via => :post
    		match :resize_cover, :via => :post
    	end
    end  	
    
    resources :contacts
      
  	post 	'peditor/:id/createPhoto'				=> 'peditor#createPhoto'
    delete 'peditor/deletePhoto/:id'				=> 'peditor#destroyPhoto' 		
  
  end
  
  devise_for :admins, :controllers => { :sessions => 'admin/sessions' }
  
  resources :pages, :controller => :static_pages do 
  	collection do
  		get ':page', :action => :show, :as => :page
  	end
  end
  
  root :to => 'static_pages#index'
  #root :to => 'static_pages#temp'
  
  get '(*url)'	 => 'errors#index'
  
end
