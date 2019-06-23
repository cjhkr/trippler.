class Post < ActiveRecord::Base
    belongs_to:user
    has_many:comments
    has_many:likes
    has_many:liked_users, through: :likes, source: :user
    mount_uploader:image, PostImageUploader
    
   
    def self.search(search)
       
       search = Post.where("title LIKE ? or content LIKE ?" , "%#{search}%","%#{search}%")
        
    end
    


end
