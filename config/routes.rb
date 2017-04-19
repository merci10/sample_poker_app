Rails.application.routes.draw do
	root 'home#new'
	post '/cards', to: 'home#create'
end
