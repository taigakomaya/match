class TweetsController < ApplicationController
    before_action :authenticate_user!
    def top
    end 
    
    def index
        @tweets = Tweet.order("RANDOM()").limit(1)
    end

    def new
        @tweets = Tweet.new
    end

    def create
        @tweets = Tweet.new(tweet_params)
        @tweets.user_id = current_user.id
        if @tweets.save
            redirect_to :action => "index"
        else
            redirect_to :action => "new"
        end
    end

    def show
        @tweet = Tweet.find(params[:id])
        
    end

    def destroy
        @tweets = Tweet.find(params[:id])
        @tweets.destroy
        redirect_to action: :index
      end

     

    private
    def tweet_params
      params.require(:tweet).permit(:name, :age, :hobby, :about, :birthday, :image, :user_id)
    end
  
end
