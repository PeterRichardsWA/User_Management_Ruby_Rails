class AddfieldPassword < ActiveRecord::Migration
  def change
  	add_column(User, 'password', :String)
  end
end
