class AddThemeToTweets < ActiveRecord::Migration[5.2]
  def change
    add_column :tweets, :theme, :string
  end
end
