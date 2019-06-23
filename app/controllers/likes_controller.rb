class LikesController < ApplicationController
  def toggle
    like=Like.find_by(user_id:current_user, post_id:params[:id])
    if like.nil?
      like=Like.new
      like.post_id=params[:id]
      like.user_id=current_user.id
      like.save
      
      render integer: like.post_id, integer: like.user_id
         
   
    else
       like=Like.find_by(user_id:current_user, post_id:params[:id])
       like.destroy
       like.save
       
       redirect_to :back
       
     end
    
  end
end
