class AddUserToArticle < ActiveRecord::Migration[5.2]
  def up
    add_column :articles, :user_id, :bigint
    user = User.find_by_email('default-user@ee')
    Article.all.each do |article|
      article.user_id = user.id
      article.save!
    end
    add_foreign_key :articles, :users, column: :user_id, on_delete: :cascade
  end

  def down
    remove_column :articles, :user_id
  end
end
