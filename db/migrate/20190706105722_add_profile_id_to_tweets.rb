class AddProfileIdToTweets < ActiveRecord::Migration[5.2]
  def change
    add_column :tweets, :profile_id, :integer
  end
end
