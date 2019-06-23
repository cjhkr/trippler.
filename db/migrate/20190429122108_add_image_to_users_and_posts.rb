class AddImageToUsersAndPosts < ActiveRecord::Migration
  def change
    add_column:Users, :avatar, :string
    add_column:Posts, :image, :string
    
  end
end
