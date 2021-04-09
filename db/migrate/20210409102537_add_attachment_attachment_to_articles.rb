class AddAttachmentAttachmentToArticles < ActiveRecord::Migration[5.2]
  def self.up
    change_table :articles do |t|
      t.attachment :attachment
    end
  end

  def self.down
    remove_attachment :articles, :attachment
  end
end
