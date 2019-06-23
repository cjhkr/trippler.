class HomeController < ApplicationController
 before_action:authenticate_user!
 before_action:check_ownership, only:[:edit, :update, :destroy]
 require 'will_paginate/array'
  def index
    @posts=Post.all.reverse.paginate(page: params[:page], per_page: 3)
    
  end
  
  def new
    
  end
  
  def posts
      @posts = Post.find_by(id: params[:id])
        
    
  end
  
  def all_post
    @posts=Post.all.reverse
  end
  
  def create
    post = Post.create(title:params[:title], content:params[:content], user_id:current_user.id, image:params[:image])
    post.save
    
    redirect_to '/home/index'
    
  end
  
  def edit
    @post = Post.find_by(id:params[:id])
    
    
  end
  
  def update
    post = Post.find_by(id:params[:id])
    post.title=params[:title]
    post.content=params[:content]
    if post.save
    
    redirect_to '/home/posts'
    
    else redirect_to :back
    
   end
  end
  
  def destroy
    post = Post.find_by(id:params[:id])
    post.destroy
    
    redirect_to :back
    

  end
  
  def comment_create
    
  comment = Comment.new
  comment.user_id = current_user.id
  comment.post_id = params[:id]
  comment.content = params[:content]
  comment.save

  redirect_to :back
  end
  
    
  def search
    @search = Post.search(params[:search])
    if !@search.present?
      flash[:alert]="no result"
    end
  end
  
  
  def profile
    @posts=Post.find_by(id:params[:id])
    
  end
  
  def profile_posts
    @profile_user = User.find_by(id:params[:id])
  end
  
  private
  
  def check_ownership
    post = Post.find_by(id:params[:id])
    redirect_to '/home/index' if current_user.id != post.user_id
    
  end

  
end
