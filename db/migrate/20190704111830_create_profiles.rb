class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.string  :study_code
      t.string  :pc_os
      t.text  :introduction
      t.timestamps
    end
  end
end
