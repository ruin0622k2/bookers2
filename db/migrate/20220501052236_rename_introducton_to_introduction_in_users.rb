class RenameIntroductonToIntroductionInUsers < ActiveRecord::Migration[6.1]
  def change
    rename_column :users, :introducton, :introduction
  end
end
