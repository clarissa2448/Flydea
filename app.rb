# app.rb

require 'bundler'
Bundler.require
require "sinatra"
require "sinatra/activerecord"
require "./models.rb"

set :database, "sqlite3:myblogdb.sqlite3"
class ApplicationController < Sinatra::Base
    get "/" do
    	@posts = Post.all
    	erb :index
    end
    get "/index.erb" do
    	@posts = Post.all
    	erb :index
    end
    get "/post_page.erb"do
       erb :post_page
    end
    get "/all_posts.erb"do
       erb :all_posts
    end
    get "/apps.erb" do
       erb :apps 
    end
    get "/food.erb" do
        erb :food
    end
    get "/results.erb"do
        erb :results
    end
    get "/no_results.erb" do
       erb :no_results 
    end
    get "/post/:id" do
        @post = Post.find(params[:id])
        erb :post_page
    end
    post '/post' do
    	@post = Post.create(category: params[:category], idea: params[:idea], likes: 0, dislikes: 0, first_name: params[:first_name], last_name: params[:last_name])
    	redirect '/index.erb'
    end
    post '/results' do
        searchTerm = params[:search]
        if searchTerm.downcase == "food"
            redirect '/food.erb'
        elsif searchTerm.downcase == "app"
            redirect '/apps.erb'
        else
            redirect '/no_results.erb'
        end
    #   searchTerm = params[:search]
    #   @posts = Post.all
    #   count = 0
    # #   @category_array = []
    #     @category = searchTerm
    #   @idea_array = []
    #   @idnum_array = []
    #   @posts.each do |post|
    #       if searchTerm = post.category.downcase
    #          count += 1
    #         @category = searchTerm
    #         @idea_array.push(post.idea)
    #         @idnum_array.push(post.id)
    #       end
          
    #   end
    #   if count == 0
    #       erb :no_results
           
    #     else 
    #         erb :results.erb
    #         @category = searchTerm
    #     end
    end
    # post '/like' do
    #     like_id = params["like_id"]
    #     @post = Post.find(like_id.to_i)
    #     like = @post.likes
    #     @post.likes = like + 1
    #     erb :all_posts
    # end
   
    # post '/sort' do
    #   @posts= Post.all
    #   first = @posts.find(1)
    #   first_likes = first.likes
    #   @likes_array = []
    #   @posts.each do |post|
    #       @likes_array.push(post.likes)
              
    #   end
    #   erb :likes
    #   puts @likes_array
    #   redirect "/likes.erb"
       
    # end
    # # Updating Stuff
    # puts '/post/:id' do
    # 	@post = Post.find(params[:id])
    # 	@post.update(category: params[:category], idea: params[:idea])
    # 	@post.save
    # 	redirect '/post/'+params[:id]
    # end 
    # # Deleting Stuff
    # delete '/post/:id' do
    # 	@post = Post.find(params[:id])
    # 	@post.destroy
    # 	redirect '/'
    # end
    
    
    # search stuff
    # post '/results.erb' do
    #     userSearch = params[:search]
    #     # iterate through Post.all and find the matching location
    #     @search = userSearch
    #     @posts = Post.all
    #     @category_array = []
    #     @idea_array = []
    #     @likes_array = []
    #     @dislikes_array = []
  
    #     count = 0
    #     @posts.each do |post|
    #         if userSearch.downcase == post.category.downcase
    #             @category=post.category;
            
    #             @idea=post.idea;
    #             @likes=post.likes;
    #             @dislikes=post.dislikes;
                
    #             @category_array.push(post.category)
    #             @idea_array.push(post.idea)
    #             @likes_array.push(post.likes)
    #             @dislikes_array.push(post.dislikes)
                
    #             count += 1
                
    #         end
    #     end
    #     if count == 0
    #         @output = "There are no related ideas :("
    #         erb :no_results
    #     else 
    #         erb :results
    #         puts @category
    #     end
    # end
end