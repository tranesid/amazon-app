Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  namespace :adi do

    #by nesting it will prepend /authors/:author_id
    #to all book routes
    resources :authors do
      resources :books
    end

    get '/books', to 'books#all_books'
    get '/books/:books_id', to 'books#find_book'
  end
end
