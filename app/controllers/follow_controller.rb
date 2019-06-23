class FollowController < ApplicationController
    
    def create
    
    follow=Follow.new
    follow.followed_id=params[:id]
    follow.follower_id=current_user.id
    follow.save
    redirect_to :back
    end
    
    def destroy
    follow=Follow.find_by(followed_id:params[:id], follower_id: current_user.id)
    follow.destroy
    
    redirect_to :back
    end
    
end
